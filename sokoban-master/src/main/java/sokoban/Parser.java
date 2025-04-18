package sokoban;

import java.io.*;
import java.nio.file.*;
import java.util.*;
import com.fasterxml.jackson.databind.*;

public class Parser {

    private static final String DOMAIN = "sokoban";
    private static final String PLAYER_NAME = "player1";

    public static void main(String[] args) {
         if (args.length < 2) {
            System.out.println("Usage: java Parser <testXX.json> <output.pddl>");
            return;
        }

        String jsonFileName = args[0];
        String outputFilename = args[1];


        try {
            File jsonFile = Paths.get("config", jsonFileName).toFile();
            ObjectMapper mapper = new ObjectMapper();
            JsonNode rootNode = mapper.readTree(jsonFile);

            String[] lines = rootNode.path("testIn").asText().split("\\n");
            int height = lines.length;

            Set<String> locations = new HashSet<>();
            Set<String> boxes = new LinkedHashSet<>();
            List<String> goals = new ArrayList<>();
            StringBuilder init = new StringBuilder();
            Set<String> adjacents = new HashSet<>();
            Set<String> directions = new HashSet<>();
            List<String> goalPositions = new ArrayList<>();

            for (int y = 0; y < height; y++) {
                String line = lines[y];
                for (int x = 0; x < line.length(); x++) {
                    char c = line.charAt(x);
                    String loc = String.format("pos_%d_%d", x, y);

                    if (c != '#') {
                        locations.add(loc);

                        // Check adjacency and directions
                        if (x < line.length() - 1 && line.charAt(x + 1) != '#') {
                            String right = String.format("pos_%d_%d", x + 1, y);
                            adjacents.add("(adjacent " + loc + " " + right + ")");
                            adjacents.add("(adjacent " + right + " " + loc + ")");
                            directions.add("(direction " + loc + " " + right + " east)");
                            directions.add("(direction " + right + " " + loc + " west)");
                        }
                        if (y < height - 1 && lines[y + 1].length() > x && lines[y + 1].charAt(x) != '#') {
                            String down = String.format("pos_%d_%d", x, y + 1);
                            adjacents.add("(adjacent " + loc + " " + down + ")");
                            adjacents.add("(adjacent " + down + " " + loc + ")");
                            directions.add("(direction " + loc + " " + down + " south)");
                            directions.add("(direction " + down + " " + loc + " north)");
                        }
                    }

                    switch (c) {
                        case ' ':
                            init.append("(clear ").append(loc).append(")\n");
                            break;
                        case '@':
                            init.append("(at ").append(PLAYER_NAME).append(" ").append(loc).append(")\n");
                            break;
                        case '+':
                            init.append("(at ").append(PLAYER_NAME).append(" ").append(loc).append(")\n");
                            init.append("(goal ").append(loc).append(")\n");
                            goalPositions.add(loc);
                            break;
                        case '.':
                            init.append("(clear ").append(loc).append(")\n");
                            init.append("(goal ").append(loc).append(")\n");
                            goalPositions.add(loc);
                            break;
                        case '*':
                            String boxGoal = "box_" + x + "_" + y;
                            boxes.add(boxGoal);
                            init.append("(box-at ").append(boxGoal).append(" ").append(loc).append(")\n");
                            init.append("(goal ").append(loc).append(")\n");
                            goalPositions.add(loc);
                            break;
                        case '$':
                            String box = "box_" + x + "_" + y;
                            boxes.add(box);
                            init.append("(box-at ").append(box).append(" ").append(loc).append(")\n");
                            break;
                    }
                }
            }

            StringBuilder objects = new StringBuilder();
            objects.append("    ").append(PLAYER_NAME).append(" - player\n");
            for (String box : boxes)
                objects.append("    ").append(box).append(" - box\n");

            for (String loc : locations)
                objects.append("    ").append(loc).append(" - location\n");

            // Création du goal correct
            Iterator<String> boxIt = boxes.iterator();
            StringBuilder goalSB = new StringBuilder();
            goalSB.append("  (:goal\n    (and\n");
            for (int i = 0; i < goalPositions.size(); i++) {
                if (boxIt.hasNext()) {
                    goalSB.append("      (box-on-goal ").append(boxIt.next()).append(")\n");
                }
            }
            goalSB.append("    )\n  )\n");



            StringBuilder pddl = new StringBuilder();
            pddl.append("(define (problem sokoban-test)\n");
            pddl.append("  (:domain ").append(DOMAIN).append(")\n");
            pddl.append("  (:objects\n").append(objects).append("  )\n");
            pddl.append("  (:init\n").append(init);
            for (String adj : adjacents) pddl.append("    ").append(adj).append("\n");
            for (String dir : directions) pddl.append("    ").append(dir).append("\n");
            pddl.append("  )\n");
            pddl.append(goalSB);
            pddl.append(")\n");

            try (BufferedWriter writer = new BufferedWriter(new FileWriter(outputFilename))) {
                writer.write(pddl.toString());
                System.out.println("Fichier généré : " + outputFilename);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
