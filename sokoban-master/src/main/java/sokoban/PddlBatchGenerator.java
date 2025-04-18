package sokoban;

import java.io.File;
import java.util.Arrays;

public class PddlBatchGenerator {

    public static void main(String[] args) {
        for (int i = 1; i <= 30; i++) {
            String inputJson = String.format("test%d.json", i);
            String outputPddl = String.format("p%02d.pddl", i);

            System.out.println(">>> Génération : " + inputJson + " -> " + outputPddl);

            ProcessBuilder builder = new ProcessBuilder(
                "java",
                "-cp", System.getProperty("java.class.path"),
                "sokoban.Parser",
                "config/" + inputJson,
                outputPddl
            );

            builder.inheritIO(); 

            try {
                Process process = builder.start();
                int exitCode = process.waitFor();
                if (exitCode == 0) {
                    System.out.println("Fichier généré : " + outputPddl);
                } else {
                    System.err.println("Erreur lors de la génération de : " + inputJson);
                }
            } catch (Exception e) {
                System.err.println("Exception pour : " + inputJson);
                e.printStackTrace();
            }
        }

        System.out.println("Tous les fichiers PDDL sont générés !");
    }
}
