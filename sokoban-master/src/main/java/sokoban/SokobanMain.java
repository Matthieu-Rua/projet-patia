package sokoban;

import com.codingame.gameengine.runner.SoloGameRunner;
import java.io.*;
import java.util.*;

public class SokobanMain {
    public static void main(String[] args) {
        try {
            String testName = "test26.json";
            String pddlFile = "p26.pddl";
            String planFile = "plan.sol";

            // 1. Appeler le parser pour générer le .pddl
            System.out.println(">> Génération du PDDL à partir de " + testName);
            String classpath = System.getProperty("java.class.path");

            Process parserProc = new ProcessBuilder(
                "java",
                "-cp", classpath,
                "sokoban.Parser",
                testName,
                pddlFile
            ).inheritIO().start();
            parserProc.waitFor();

            // 2. Appeler le solveur PDDL
            System.out.println(">> Résolution du PDDL via planificateur");
            Process plannerProc = new ProcessBuilder(
                "java",
                "-Xmx4096m",
                "-cp", "../pddl4j-4.0.0.jar",
                "fr.uga.pddl4j.planners.statespace.HSP",
                "domain.pddl",
                pddlFile,
                "-t", "600",
                "-e", "SUM"
            ).start();

            plannerProc.waitFor();

            // 3. Lire le plan
            List<String> actions = new ArrayList<>();
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(plannerProc.getInputStream()))) {
                String line;
                while ((line = reader.readLine()) != null) {
                   

                    line = line.trim();
                    if (line.matches("^\\d+:\\s*\\(.*\\)\\s*\\[\\d+\\]$")) {
                        // Exemple : "00: (move player1 pos_3_3 pos_3_4) [0]"
                        int start = line.indexOf('(');
                        int end = line.lastIndexOf(')');
                        if (start != -1 && end != -1 && end > start) {
                            String action = line.substring(start, end + 1).toLowerCase();
                            actions.add(action);
                        }
                    }
                }
            }

            // 4. Donner le plan à l'agent
            try (BufferedWriter out = new BufferedWriter(new FileWriter("plan.txt"))) {
                for (String action : actions) {
                    String cmd = convertToDirection(action);
                    out.write(cmd);
                }
                System.out.println("plan.txt généré !");
            } catch (IOException e) {
                e.printStackTrace();
            }

            // 5. Lancer l'affichage graphique
            SoloGameRunner gameRunner = new SoloGameRunner();
            gameRunner.setAgent(Agent.class);
            gameRunner.setTestCase(testName);
            gameRunner.start();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static String convertToDirection(String action) {
        try {
            String cleaned = action.replace("(", "").replace(")", "").trim();
            String[] parts = cleaned.split("\\s+");

            String type = parts[0];
            String from, to;

            if (type.equals("move")) {
                from = parts[2];
                to = parts[3];
            } else if (type.startsWith("push")) {
                from = parts[3]; // position initiale du joueur
                to = parts[4];   // position de la boîte (où va le joueur)
            } else {
                return "?"; // Action inconnue
            }

            int[] fromCoords = extractCoords(from);
            int[] toCoords = extractCoords(to);

            int dx = toCoords[0] - fromCoords[0];
            int dy = toCoords[1] - fromCoords[1];

            if (dx == 1) return "R";
            if (dx == -1) return "L";
            if (dy == 1) return "D";
            if (dy == -1) return "U";

            return "?"; // Déplacement non standard
        } catch (Exception e) {
            e.printStackTrace();
            return "?";
        }
    }


    private static int[] extractCoords(String pos) {
        String[] split = pos.trim().split("_");
        return new int[] {
            Integer.parseInt(split[1]),
            Integer.parseInt(split[2])
        };
    }

}
