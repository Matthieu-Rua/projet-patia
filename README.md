# Résolution du taquin (N-Puzzle)

Ce projet implémente plusieurs algorithmes de recherche pour résoudre le jeu du taquin (`N-Puzzle`) de manière automatique. Il est possible de générer des puzzles aléatoires de tailles et difficultés variées, puis de les résoudre avec différentes méthodes.

---

## 📦 Contenu

- `generate_npuzzle.py` : génération de puzzles aléatoires
- `solve_npuzzle.py` : résolution avec BFS, DFS et A*
- `benchmark_npuzzle.py` : exécution automatisée des tests + mesures de temps
- `plot_results.py` : visualisation des performances des algorithmes
- `puzzles/` : puzzles générés (3x3 et 4x4)
- `results.csv` : résultats des benchmarks
- `graphes/` : images des courbes générées

---

## 🧩 1. Génération de puzzles

Pour générer des puzzles de tailles différentes :

```bash
python3 generate_npuzzle.py -s 3 -ml 16 -n 2 puzzles/puzzles_3x3/
python3 generate_npuzzle.py -s 4 -ml 16 -n 2 puzzles/puzzles_4x4/
