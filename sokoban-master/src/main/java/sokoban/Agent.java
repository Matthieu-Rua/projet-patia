package sokoban;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class Agent {
    public static void main(String[] args) {
        String sequence = "";
        File file = new File("plan.txt");
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            sequence = reader.readLine();
        } catch (IOException e) {
            System.err.println("Error reading sequence file.");
            e.printStackTrace();
        }

        // Une lettre = une frame
        if (sequence != null) {
            for (char c : sequence.toCharArray()) {
                System.out.println(c);
            }
        }
    }
}
