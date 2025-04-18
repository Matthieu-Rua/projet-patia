package fr.uga.pddl4j.yasp;

import fr.uga.pddl4j.heuristics.state.FastForward;
import fr.uga.pddl4j.parser.DefaultParsedProblem;
import fr.uga.pddl4j.parser.ErrorManager;
import fr.uga.pddl4j.parser.Message;
import fr.uga.pddl4j.parser.Parser;
import fr.uga.pddl4j.problem.DefaultProblem;
import fr.uga.pddl4j.problem.Problem;
import fr.uga.pddl4j.problem.State;
import fr.uga.pddl4j.planners.statespace.AbstractStateSpacePlanner;
import fr.uga.pddl4j.planners.LogLevel;
import fr.uga.pddl4j.plan.Plan;

import org.sat4j.core.VecInt;
import org.sat4j.minisat.SolverFactory;
import org.sat4j.specs.ContradictionException;
import org.sat4j.specs.IProblem;
import org.sat4j.specs.ISolver;
import org.sat4j.specs.IVecInt;
import org.sat4j.specs.TimeoutException;

import java.io.FileNotFoundException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Implements a SAT-based planner using PDDL4J and SAT4J.
 * 
 * @author H. Fiorino
 * @version 0.1 - 29.03.2024
 */
public class YetAnotherSATPlanner extends AbstractStateSpacePlanner {

    /**
     * Constants for SAT solver configuration.
     */
    static final int MAXSTEPS = 50;
    static final int MAXVAR = 1000000;
    static final int NBCLAUSES = 500000;
    static final int TIMEOUT = 3600;

    static final boolean DEBUG = false;

    /**
     * Instantiates the planning problem from a parsed problem.
     *
     * @param problem the parsed problem.
     * @return the instantiated planning problem or null if it cannot be instantiated.
     */
    @Override
    public Problem instantiate(DefaultParsedProblem problem) {
        final Problem pb = new DefaultProblem(problem);
        pb.instantiate();
        return pb;
    }

    /**
     * Solves the planning problem using SAT encoding and returns the first solution found.
     *
     * @param problem the problem to be solved.
     * @return the plan found or null if no solution exists.
     */
    @Override
    public Plan solve(final Problem problem) {

        int stepmax = MAXSTEPS;
        Plan plan = null;

        final FastForward ff = new FastForward(problem);
        final int hlb = ff.estimate(new State(problem.getInitialState()), problem.getGoal());
        if (hlb > MAXSTEPS) {
            System.out.println("Problem has no solution in " + MAXSTEPS + " steps!");
            System.out.println("At least " + hlb + " steps are necessary.");
            return null;
        }

        int steps = hlb;
        boolean doSearch = true;

        while (doSearch && steps <= stepmax) {

            SATEncoding sat = new SATEncoding(problem, steps);

            final ISolver solver = SolverFactory.newDefault();
            solver.setTimeout(TIMEOUT);
            solver.newVar(MAXVAR);
            solver.setExpectedNumberOfClauses(NBCLAUSES);
            IProblem ip = solver;

            try {
                for (List<Integer> clause : sat.getClauses()) {
                    IVecInt vec = new VecInt(clause.size());
                    for (int lit : clause) {
                        vec.push(lit);
                    }
                    solver.addClause(vec);
                }

                IVecInt goalVec = new VecInt(sat.getGoalClauses().size());
                for (int lit : sat.getGoalClauses()) {
                    goalVec.push(lit);
                }
                solver.addClause(goalVec);

                if (solver.isSatisfiable()) {
                    int[] model = ip.model();
                    if (DEBUG) {
                        System.out.println("SAT Model: " + Arrays.toString(model));
                    }
                    List<Integer> validModel = Arrays.stream(model)
                            .boxed()
                            .filter(lit -> lit > 0)
                            .collect(Collectors.toList());

                    plan = sat.extractPlan(validModel, problem);
                    doSearch = false;
                } else {
                    steps++;
                }
            } catch (ContradictionException e) {
                System.out.println("Contradiction detected, no plan possible with " + steps + " steps.");
                return null;
            } catch (TimeoutException e) {
                System.out.println("SAT solver timeout reached, aborting search.");
                return null;
            }
        }

        return plan;
    }

    /**
     * Main method to parse and solve a PDDL planning problem.
     *
     * @param args command line arguments: [domain file] [problem file]
     */
    public static void main(final String[] args) {

        // Checks the number of arguments from the command line
        if (args.length != 2) {
            System.out.println("Invalid command line");
            return;
        }

        try {
            // Creates an instance of the PDDL parser
            final Parser parser = new Parser();
            parser.setLogLevel(LogLevel.OFF);
            // Parses the domain and the problem files.
            final DefaultParsedProblem parsedProblem = parser.parse(args[0], args[1]);
            // Gets the error manager of the parser
            final ErrorManager errorManager = parser.getErrorManager();
            // Checks if the error manager contains errors
            if (!errorManager.isEmpty()) {
                // Prints the errors
                for (Message m : errorManager.getMessages()) {
                    System.out.println(m.toString());
                }
            } else {
                
                // Creates an instance of the SAT planner
                final YetAnotherSATPlanner planner = new YetAnotherSATPlanner();

                // Prints that the domain and the problem were successfully parsed
                System.out.print("\nparsing domain file \"" + args[0] + "\" done successfully");
                System.out.print("\nparsing problem file \"" + args[1] + "\" done successfully\n\n");
                
                // Create a problem
                final Problem problem = planner.instantiate(parsedProblem);

                // Check if the goal is trivially unsatisfiable
                if (!problem.isSolvable()) {
                    System.out.println("Goal can be simplified to FALSE. No search will solve it");
                    System.exit(0);
                } else {
                    
                    Plan plan = planner.solve(problem);
                        
                        if (plan != null) {
                            System.out.println(problem.toString(plan));
                        } else {
                            System.out.println("No solution found!");
                        }
                }
            }
            // This exception could happen if the domain or the problem does not exist
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
}
