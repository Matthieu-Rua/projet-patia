package fr.uga.pddl4j.yasp;

import fr.uga.pddl4j.plan.Plan;
import fr.uga.pddl4j.plan.SequentialPlan;
import fr.uga.pddl4j.problem.Fluent;
import fr.uga.pddl4j.problem.Problem;
import fr.uga.pddl4j.problem.operator.Action;
import fr.uga.pddl4j.util.BitVector;

import java.util.*;

public final class SATEncoding {

    private final List<Integer> goalList = new ArrayList<>();
    private final List<List<Integer>> currentDimacs = new ArrayList<>();
    private final List<Integer> currentGoal = new ArrayList<>();
    private final HashMap<Integer, List<Integer>> addList = new HashMap<>();
    private final HashMap<Integer, List<Integer>> delList = new HashMap<>();
    private final List<List<Integer>> stateTransitionList = new ArrayList<>();
    private final int steps;

    public SATEncoding(Problem problem, int steps) {
        this.steps = steps;

        final int nbFluents = problem.getFluents().size();
        final List<Action> actions = problem.getActions();
        final BitVector init = problem.getInitialState().getPositiveFluents();
        final BitVector goal = problem.getGoal().getPositiveFluents();

        // --- Initial state ---
        for (int i = 0; i < nbFluents; i++) {
            int lit = pair(i + 1, 1);
            if (init.get(i)) {
                this.currentDimacs.add(List.of(lit));
            } else {
                this.currentDimacs.add(List.of(-lit));
            }
        }
        // --- Goal state ---
        for (int i = 0; i < nbFluents; i++) {
            if (goal.get(i)) {
                this.goalList.add(pair(i + 1, steps));
            }
        }

        if (!this.goalList.isEmpty()) {
            this.currentGoal.addAll(this.goalList);
        } else {
            System.out.println("⚠ Aucune clause de but trouvée, vérifiez l'encodage !");
        }

        // --- Encoding per time step ---
        for (int t = 1; t <= steps; t++) {
            List<Integer> disjunctionAtT = new ArrayList<>();

            for (int a = 0; a < actions.size(); a++) {
                Action action = actions.get(a);
                int actionLit = pair(nbFluents + a + 1, t);
                disjunctionAtT.add(actionLit);
                
                // Preconditions
                for (int i = 0; i < nbFluents; i++) {
                    if (action.getPrecondition().getPositiveFluents().get(i)) {
                        this.currentDimacs.add(List.of(-actionLit, pair(i + 1, t)));
                    }
                    if (action.getPrecondition().getNegativeFluents().get(i)) {
                        this.currentDimacs.add(List.of(-actionLit, -pair(i + 1, t)));
                    }
                }

                // Effects
                for (int i = 0; i < nbFluents; i++) {
                    if (action.getUnconditionalEffect().getPositiveFluents().get(i)) {
                        this.currentDimacs.add(List.of(-actionLit, pair(i + 1, t + 1)));
                        this.addList.computeIfAbsent(pair(i + 1, t + 1), k -> new ArrayList<>()).add(actionLit);
                    }
                    if (action.getUnconditionalEffect().getNegativeFluents().get(i)) {
                        this.currentDimacs.add(List.of(-actionLit, -pair(i + 1, t + 1)));
                        this.delList.computeIfAbsent(pair(i + 1, t + 1), k -> new ArrayList<>()).add(actionLit);
                    }
                }
            }

            // Au moins une action à chaque étape
            this.currentDimacs.add(disjunctionAtT);
        }

        // --- Mutex (interférence entre actions) ---
        for (int t = 1; t <= steps; t++) {
            for (int a1 = 0; a1 < actions.size(); a1++) {
                for (int a2 = a1 + 1; a2 < actions.size(); a2++) {
                    Action act1 = actions.get(a1);
                    Action act2 = actions.get(a2);
                    if (interfere(act1, act2)) {
                        int lit1 = pair(nbFluents + a1 + 1, t);
                        int lit2 = pair(nbFluents + a2 + 1, t);
                        this.currentDimacs.add(List.of(-lit1, -lit2));
                    }
                }
            }
        }


        // --- Frame Axioms
        for (int t = 1; t < steps; t++) {
            for (int i = 0; i < nbFluents; i++) {
                int fluentAtT = pair(i + 1, t);
                int fluentAtT1 = pair(i + 1, t + 1);
                List<Integer> clause = new ArrayList<>();
                clause.add(-fluentAtT);
                clause.add(fluentAtT1);
                if (this.addList.containsKey(fluentAtT1)) {
                    clause.addAll(this.addList.get(fluentAtT1));
                }
                if (this.delList.containsKey(fluentAtT1)) {
                    for (int del : this.delList.get(fluentAtT1)) {
                        clause.add(-del);
                    }
                }
                this.stateTransitionList.add(clause);
            }
        }

        // --- Justification des préconditions (version douce)
        for (int t = 2; t <= steps; t++) {
            for (int a = 0; a < actions.size(); a++) {
                Action action = actions.get(a);
                int actionLit = pair(nbFluents + a + 1, t);
                BitVector prePos = action.getPrecondition().getPositiveFluents();

                for (int i = 0; i < nbFluents; i++) {
                    if (prePos.get(i)) {
                        int fluentPrev = pair(i + 1, t - 1);
                        List<Integer> clause = new ArrayList<>();
                        clause.add(-actionLit);
                        clause.add(fluentPrev);
                        clause.addAll(addList.getOrDefault(fluentPrev, Collections.emptyList()));
                        this.currentDimacs.add(clause);
                    }
                }
            }
        }

        // Ajout des états initiaux et transitions
        
        this.currentDimacs.addAll(this.stateTransitionList);

        System.out.println("Encoding : successfully done (" + (this.currentDimacs.size() + this.currentGoal.size()) + " clauses, " + steps + " steps)");
    }

    private boolean interfere(Action a1, Action a2) {
        BitVector a1Pos = a1.getUnconditionalEffect().getPositiveFluents();
        BitVector a1Neg = a1.getUnconditionalEffect().getNegativeFluents();

        BitVector a2PrePos = a2.getPrecondition().getPositiveFluents();
        BitVector a2PreNeg = a2.getPrecondition().getNegativeFluents();

        BitVector a2Pos = a2.getUnconditionalEffect().getPositiveFluents();
        BitVector a2Neg = a2.getUnconditionalEffect().getNegativeFluents();

        BitVector a1PrePos = a1.getPrecondition().getPositiveFluents();
        BitVector a1PreNeg = a1.getPrecondition().getNegativeFluents();

        return a1Pos.intersects(a2PreNeg) || a1Neg.intersects(a2PrePos) ||
               a2Pos.intersects(a1PreNeg) || a2Neg.intersects(a1PrePos) ||
               a1Pos.intersects(a2Neg) || a1Neg.intersects(a2Pos);
    }

    public List<List<Integer>> getClauses() {
        return this.currentDimacs;
    }

    public List<Integer> getGoalClauses() {
        return this.currentGoal;
    }

    public Plan extractPlan(final List<Integer> solution, final Problem problem) {
        Plan plan = new SequentialPlan();
        HashMap<Integer, List<Action>> sequence = new HashMap<>();
        final int nbFluents = problem.getFluents().size();

        for (Integer x : solution) {
            if (x > 0) {
                int[] couple = unpair(x);
                int bitnum = couple[0];
                int step = couple[1];

                if (bitnum > nbFluents) {
                    final Action action = problem.getActions().get(bitnum - nbFluents - 1);
                    sequence.computeIfAbsent(step, k -> new ArrayList<>()).add(action);
                }
            }
        }

        System.out.println("=== Extracted Plan Steps ===");
        List<Integer> orderedSteps = new ArrayList<>(sequence.keySet());
        Collections.sort(orderedSteps);

        for (int t : orderedSteps) {
            for (Action action : sequence.get(t)) {
                System.out.println("Step " + t + " : " + problem.toShortString(action));
                plan.add(t, action);
            }
        }

        return plan;
    }

    private static int pair(int x, int y) {
        return ((x + y) * (x + y + 1)) / 2 + y;
    }

    private static int[] unpair(int z) {
        int w = (int) Math.floor((Math.sqrt(8 * z + 1) - 1) / 2);
        int t = (w * (w + 1)) / 2;
        int y = z - t;
        int x = w - y;
        return new int[]{x, y};
    }

    private String extractBallName(String fluentImage) {
        // Exemple : (at ball1 rooma) ou (carry ball1 left)
        String[] parts = fluentImage.replace("(", "").replace(")", "").split(" ");
        if (parts.length >= 2 && (parts[0].equals("at") || parts[0].equals("carry"))) {
            return parts[1]; // "ball1"
        }
        return null;
    }

    private String extractGripperName(String fluentImage) {
        // Exemple : (free left)
        String[] parts = fluentImage.replace("(", "").replace(")", "").split(" ");
        if (parts.length == 2 && parts[0].equals("free")) {
            return parts[1]; // "left"
        }
        return null;
}


    public String toString(final List<Integer> clause, final Problem problem) {
        final int nb_fluents = problem.getFluents().size();
        List<Integer> dejavu = new ArrayList<>();
        StringBuilder t = new StringBuilder("[");
        StringBuilder u = new StringBuilder();
        int tmp = 1;
        int[] couple;
        int bitnum, step;

        for (Integer x : clause) {
            if (x > 0) {
                couple = unpair(x);
                bitnum = couple[0];
                step = couple[1];
            } else {
                couple = unpair(-x);
                bitnum = -couple[0];
                step = couple[1];
            }
            t.append("(").append(bitnum).append(", ").append(step).append(")");
            t.append((tmp == clause.size()) ? "]\n" : " + ");
            tmp++;
            final int b = Math.abs(bitnum);
            if (!dejavu.contains(b)) {
                dejavu.add(b);
                u.append(b).append(" >> ");
                if (nb_fluents >= b) {
                    Fluent fluent = problem.getFluents().get(b - 1);
                    u.append(problem.toString(fluent)).append("\n");
                } else {
                    u.append(problem.toShortString(problem.getActions().get(b - nb_fluents - 1))).append("\n");
                }
            }
        }
        return t + u.toString();
    }
}
