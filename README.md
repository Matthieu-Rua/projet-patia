# Résolution du Taquin (N-Puzzle) avec BFS, DFS et A*

## Présentation

Cette partie du projet implémente la résolution du taquin (n-puzzle) via trois algorithmes de recherche :
- **BFS** : Recherche en largeur d’abord
- **DFS** : Recherche en profondeur d’abord
- **A\*** : Recherche informée avec heuristique (distance de Manhattan)

Fonctionnalités :
1. Génération automatique de puzzles aléatoires
2. Résolution avec 3 algorithmes
3. Comparaison des performances (temps d’exécution)
4. Visualisation graphique des résultats



## Structure du projet

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
└── graphes/                   # Images des courbes (si générées)
```



## Dépendances

Installez les bibliothèques nécessaires :

```bash
pip install pandas matplotlib
```



## 1. Génération de puzzles

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



## 2. Résolution d’un puzzle

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



## 3. Exécution automatique des tests

Lancez tous les benchmarks sur les puzzles 3x3 et 4x4 :

```bash
python3 benchmark_npuzzle.py
```

Ce script :
- Résout tous les puzzles présents dans les dossiers
- Exécute chaque puzzle avec les 3 algorithmes
- Mesure le temps de résolution
- Sauvegarde les résultats dans `results.csv`



## 4. Visualisation des performances

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



## 🔍 Analyse des résultats observés

### A\* :
- Très rapide et précis
- Résout tous les puzzles testés
- Temps de résolution stable, même avec des puzzles complexes

### BFS :
- Rapide sur les petits puzzles (3x3)
- Devient lent sur les puzzles 4x4 avec plus de 16 mouvements
- Temps de résolution croît de manière exponentielle

### ⚠️ DFS :
- Échoue souvent
- Très lent voire inutilisable sur les puzzles 4x4
- Pas de détection de cycles ni limite de profondeur



# Résolution du Taquin et des Tours de Hanoï en PDDL (PDDL4J)

## Objectif

Cette partie du projet vise à modéliser et résoudre les puzzles du **taquin** (3x3 et 4x4) et les **tours de Hanoï** (3 disques, 3 piquets) à l’aide du langage **PDDL**.

Le solveur utilisé est **PDDL4J**, en mode ASTAR avec l’**heuristique Fast Forward**.



## Structure des fichiers PDDL

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

```



##  Lancement des tests

### Exemple de commande pour résoudre un problème :

```bash
./pddl4j.sh
```

- Choisir **option 1** (HSP)
- `hanoi/domain.pddl` et `hanoi/p001.pddl` ou `taquin/domain.pddl` et `taquin/pXXX.pddl` 
- Choisir **heuristique 5 (FAST_FORWARD)**



## Résultats observés

- Tous les fichiers `.pddl` ont été instanciés avec succès.
- Le solveur a trouvé un plan valide pour chaque problème (y compris les taquins 4x4).
- Les temps de résolution sont faibles (< 0.2s).
- Aucun échec, timeout ou dépassement mémoire.

Les résultats détaillés sont disponibles dans `results_taquin.txt`.


## Remarques

- Le domaine du taquin inclut toutes les relations `adjacent` nécessaires.
- Les états initiaux ont été extraits de puzzles générés dans la première partie du projet.



# Sokoban : Application Web avec Planificateur PDDL intégré

## Objectif

Cette application implémente une **résolution automatique de niveaux de Sokoban** à partir de fichiers `.json` contenant les cartes du jeu.  
Elle repose sur un **planificateur PDDL4J** intégré au code Java, et affiche la solution dans une **interface graphique web interactive**.

Cette application fonctionne depuis la **VM PATIA**.



##  Structure du projet

```
sokoban-master/
├── config/                    # Contient les fichiers testXX.json des niveaux Sokoban
├── domain.pddl               # Domaine PDDL utilisé pour la planification
├── src/
│   └── main/java/sokoban/    # Code Java principal de l'application
│       ├── Parser.java       # Convertit JSON → PDDL
│       ├── PddlBatchGenerator.java
│       ├── SokobanMain.java  # Classe principale (point d’entrée)
│       └── ...               # Autres fichiers nécessaires (Board, Agent...)
├── plan.sol                  # Plan généré brut par le solveur

```



## Fonctionnement de l’application

### Étapes de résolution

1. Un niveau Sokoban est défini dans un fichier `.json` (ex: `test1.json`)
2. `Parser.java` convertit ce fichier en un fichier problème PDDL `.pddl`
3. Le solveur PDDL4J est lancé avec `domain.pddl` et le fichier `.pddl`
4. Le plan est lu et converti en une séquence de mouvements (UDLR)
5. `SokobanMain.java` lance une interface web et anime la solution



## Lancer l'application depuis la VM

### Étape 1 : Compilation du projet

Depuis le dossier `sokoban-master` :

```bash
mvn clean compile assembly:single
```

Cela produit le fichier :
```
target/sokoban-1.0-SNAPSHOT-jar-with-dependencies.jar
```



### Étape 2 : Lancer l'interface graphique

```bash
java --add-opens java.base/java.lang=ALL-UNNAMED      -server -Xms2048m -Xmx2048m      -cp target/sokoban-1.0-SNAPSHOT-jar-with-dependencies.jar      sokoban.SokobanMain
```

Puis, ouvre ton navigateur à l’adresse suivante :

  **http://localhost:8888/test.html**



### Pour changer de niveau (fichier `.json`)

1. Ouvre le fichier :  
   `src/main/java/sokoban/SokobanMain.java`

2. Modifie les lignes suivantes :

```java
String testName = "test1.json";   // ← remplace par "test26.json" ou autre
String pddlFile = "p01.pddl";
String planFile = "plan.sol";
```

3. Sauvegarde, puis recompile avec :

```bash
mvn clean compile assembly:single
```

4. Relance l’interface graphique comme vu plus haut.



## Planificateur utilisé

L’application utilise **PDDL4J 4.0.0** installé localement via Maven.  
Le planificateur est lancé automatiquement via le code Java, en appelant le `.jar` depuis :

```java
java -jar ../pddl4j-4.0.0.jar -o domain.pddl -f <problem>.pddl -s -e FAST_FORWARD
```



## Résumé des composants clés

| Fichier                     | Rôle                                         |
|-|-|
| `Parser.java`              | Génère un fichier PDDL depuis un `.json`     |
| `domain.pddl`              | Définit les actions possibles dans Sokoban   |
| `SokobanMain.java`         | Gère l'ensemble du processus + interface     |
| `plan.txt`                 | Contient les mouvements UDLR pour l'animation|
| `testX.json`               | Cartes Sokoban à résoudre                    |

---

#  Yet Another SAT Planner - Résolution PDDL via encodage SAT

##  Objectif

Cette partie du projet consiste à implémenter un **planificateur basé sur SAT** permettant de résoudre des problèmes formulés en **langage PDDL**.  
Le planificateur encode le problème sous forme de formules logiques, puis les résout à l'aide d'un solveur SAT.

---

##  Contenu du dossier

```
YetAnotherSATPlanner/
├── src/                         # Fichiers source Java (SATEncoding.java, ...)
├── yetanothersatplanner.sh     # Script interactif de compilation et test
├── results_sat.txt             # Résultat de test démontrant un cas fonctionnel
```

---

##  Fonctionnement

L'utilisateur peut :
1. Compiler le planificateur avec l'option `1`
2. Choisir un domaine et un problème PDDL avec l'option `2`
3. Le planificateur teste toutes les profondeurs de plan de 1 à `MAXSTEPS` (50 par défaut)
4. Si un plan est trouvé, il est affiché étape par étape

---

##  Exemple fonctionnel (taquin/p001.pddl)

Ce test utilise un problème **simple du taquin (3x3)**.  
Le planificateur SAT a correctement encodé et résolu ce problème en **1 étape**.

```bash
Enter domain file [path to the file]: ../taquin/domain.pddl
Enter problem file [path to the file]: ../taquin/p001.pddl

Encoding : successfully done (7107 clauses, 1 steps)
=== Extracted Plan Steps ===
Step 1 : move tile3 pos1 pos4
```

 Voir le fichier `results_sat.txt` pour le log complet.

---

## Limitations connues

Bien que le planificateur fonctionne pour certains cas simples, il **échoue à résoudre des problèmes pourtant très simples** (ex: `sokoban/p00.pddl`, ou taquin len4).  
Cela est probablement dû à des **limitations dans l'encodage** :
- Support partiel de la syntaxe PDDL (ex: préconditions complexes, `not`, effets conditionnels)
- Prédicats ignorés ou mal interprétés
- Actions encodées de façon trop simpliste

---

## Pourquoi cela n’a pas été corrigé

Corriger ces limitations nécessiterait :
- Une **analyse complète du parseur PDDL**
- Un **debug de l'encodage SAT** clause par clause
- Du **temps significatif** pour étendre la couverture de PDDL

En fin de projet, ces ajustements n’ont pas pu être réalisés à temps.

---

## Conclusion

L’implémentation montre un **fonctionnement correct sur des cas simples**, prouvant que :
- Le pipeline PDDL → SAT → Résolution → Plan fonctionne
- La structure du solveur est exploitable

Des limitations restent présentes pour des problèmes plus complexes (Sokoban, Taquin long), mais l’approche est bien amorcée.