# Résolution du Taquin (N-Puzzle) avec BFS, DFS et A*

## 🧩 Présentation

Ce projet implémente la résolution du taquin (n-puzzle) via trois algorithmes de recherche :
- **BFS** : Recherche en largeur d’abord
- **DFS** : Recherche en profondeur d’abord
- **A\*** : Recherche informée avec heuristique (distance de Manhattan)

Fonctionnalités :
1. Génération automatique de puzzles aléatoires
2. Résolution avec 3 algorithmes
3. Comparaison des performances (temps d’exécution)
4. Visualisation graphique des résultats

---

## 📁 Structure du projet

```
.
├── generate_npuzzle.py        # Générateur de puzzles
├── solve_npuzzle.py           # Résolution d’un puzzle par un algorithme
├── benchmark_npuzzle.py       # Lancement automatique des tests
├── plot_results.py            # Génération de courbes de performance
├── puzzles/
│   ├── puzzles_3x3/           # Puzzles 3x3 générés
│   └── puzzles_4x4/           # Puzzles 4x4 générés
├── results.csv                # Résultats des benchmarks
└── graphes/ (optionnel)       # Images des courbes (si générées)
```

---

## 🛠️ Dépendances

Installez les bibliothèques nécessaires :

```bash
pip install pandas matplotlib
```

---

## 🔧 1. Génération de puzzles

Lancez le générateur avec :

```bash
python3 generate_npuzzle.py -s <taille> -ml <mouvements> -n <quantité> <dossier>
```

Exemples :
```bash
# Génère 2 puzzles 3x3 avec 16 mouvements
python3 generate_npuzzle.py -s 3 -ml 16 -n 2 puzzles/puzzles_3x3/

# Génère 2 puzzles 4x4 avec 32 mouvements
python3 generate_npuzzle.py -s 4 -ml 32 -n 2 puzzles/puzzles_4x4/
```

Paramètres :
- `-s` : taille du puzzle (`3` pour 3x3, `4` pour 4x4)
- `-ml` : difficulté (nombre de mouvements de mélange)
- `-n` : nombre de puzzles à générer

---

## 🤖 2. Résolution d’un puzzle

Utilisez `solve_npuzzle.py` :

```bash
python3 solve_npuzzle.py <fichier_puzzle> -a <algo> [-v]
```

Exemple :
```bash
python3 solve_npuzzle.py puzzles/puzzles_3x3/npuzzle_3x3_len16_0.txt -a astar -v
```

Paramètres :
- `-a` : algorithme (`bfs`, `dfs`, `astar`)
- `-v` : mode verbeux (affiche l’état initial, le plan et la durée)

---

## 🧪 3. Exécution automatique des tests

Lancez tous les benchmarks sur les puzzles 3x3 et 4x4 :

```bash
python3 benchmark_npuzzle.py
```

Ce script :
- Résout tous les puzzles présents dans les dossiers
- Exécute chaque puzzle avec les 3 algorithmes
- Mesure le temps de résolution
- Sauvegarde les résultats dans `results.csv`

---

## 📊 4. Visualisation des performances

Générez les graphiques comparatifs avec :

```bash
python3 plot_results.py
```

Cela crée deux graphiques :
- Un pour les puzzles **3x3**
- Un pour les puzzles **4x4**

Axes :
- **X** : nombre de mouvements pour réordonner le puzzle (difficulté)
- **Y** : temps moyen de résolution (secondes)
- **Couleurs** : un par algorithme (BFS, DFS, A*)

---

## 🔍 Analyse des résultats observés

### ✅ A\* :
- Très rapide et précis
- Résout tous les puzzles testés
- Temps de résolution stable, même avec des puzzles complexes

### ✅ BFS :
- Rapide sur les petits puzzles (3x3)
- Devient lent sur les puzzles 4x4 avec plus de 16 mouvements
- Temps de résolution croît de manière exponentielle

### ⚠️ DFS :
- Échoue souvent
- Très lent voire inutilisable sur les puzzles 4x4
- Pas de détection de cycles ni limite de profondeur

---

# 🧠 Résolution du Taquin et des Tours de Hanoï en PDDL (PDDL4J)

## 📄 Objectif

Cette partie du projet vise à modéliser et résoudre les puzzles du **taquin** (3x3 et 4x4) et les **tours de Hanoï** (3 disques, 3 piquets) à l’aide du langage **PDDL**.

Le solveur utilisé est **PDDL4J**, en mode ASTAR avec l’**heuristique Fast Forward (n°5)**.

---

## 📁 Structure des fichiers PDDL

```
pddl/
├── hanoi/
│   ├── domain.pddl       # Domaine PDDL pour les tours de Hanoï
│   └── p001.pddl         # Problème : 3 disques sur 3 piquets

├── taquin/
│   ├── domain.pddl       # Domaine PDDL pour le taquin
│   ├── p001.pddl         # Puzzle 3x3 - difficulté faible (len3)
│   ├── p002.pddl         # Puzzle 3x3 - difficulté moyenne (len8)
│   ├── p003.pddl         # Puzzle 3x3 - difficulté haute (len16)
│   ├── p004.pddl         # Puzzle 4x4 - faible (len2)
│   └── p005.pddl         # Puzzle 4x4 - moyenne (len8)

├── pddl4j.sh             # Script de lancement PDDL4J
├── results_taquin.txt    # Résultats détaillés des tests sur le taquin
```

---

## ▶️ Lancement des tests

### Exemple de commande pour résoudre un problème :

```bash
./pddl4j.sh
```

- Choisir **option 1** (HSP)
- Entrer les chemins vers `domain.pddl` et `pXXX.pddl`
- Choisir **heuristique 5 (FAST_FORWARD)**

---

## ✅ Résultats observés

- Tous les fichiers `.pddl` ont été instanciés avec succès.
- Le solveur a trouvé un plan valide pour chaque problème (y compris les taquins 4x4).
- Les temps de résolution sont faibles (< 0.2s).
- Aucun échec, timeout ou dépassement mémoire.

Les résultats détaillés sont disponibles dans `results_taquin.txt`.

---

## 💬 Remarques

- Le domaine du taquin inclut toutes les relations `adjacent` nécessaires.
- Les états initiaux ont été extraits de puzzles générés dans la première partie du projet.
- Le fichier `domain.pddl` utilisé pour le taquin est compatible avec les positions `pos1` à `pos9` (ou `pos16`).
