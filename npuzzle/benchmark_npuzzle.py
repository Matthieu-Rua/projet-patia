import os
import subprocess
import time
import csv

ALGORITHMS = ['bfs', 'dfs', 'astar']
PUZZLE_DIRS = ['puzzles/puzzles_3x3', 'puzzles/puzzles_4x4']
OUTPUT_CSV = 'results.csv'

def run_solver(puzzle_path, algo):
    cmd = ['python3', 'solve_npuzzle.py', puzzle_path, '-a', algo]
    start = time.time()
    result = subprocess.run(cmd, capture_output=True, text=True)
    end = time.time()
    duration = round(end - start, 4)

    solved = 'Valid solution: True' in result.stdout
    return duration, solved, result.stdout.strip()

def main():
    with open(OUTPUT_CSV, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(['Puzzle', 'Size', 'Moves', 'Algo', 'Time(s)', 'Solved'])

        for folder in PUZZLE_DIRS:
            for filename in sorted(os.listdir(folder)):
                if filename.endswith('.txt'):
                    filepath = os.path.join(folder, filename)

                    # Parse metadata from filename
                    size = filename.split('_')[1]  # e.g., 3x3
                    length = filename.split('_len')[1].split('_')[0]  # e.g., 8

                    for algo in ALGORITHMS:
                        try:
                            time_taken, solved, _ = run_solver(filepath, algo)
                        except Exception as e:
                            time_taken, solved = -1, False

                        writer.writerow([filename, size, length, algo, time_taken, solved])
                        print(f"{filename} | {algo} | {time_taken}s | Solved: {solved}")

if __name__ == '__main__':
    main()
