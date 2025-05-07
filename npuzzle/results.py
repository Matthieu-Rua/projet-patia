import pandas as pd
import matplotlib.pyplot as plt

# Chargement du fichier CSV
df = pd.read_csv('results.csv')

# Filtrage : uniquement les solutions trouvées
df = df[df['Time(s)'] > 0] 

# Séparer par taille
sizes = df['Size'].unique()

for size in sizes:
    df_size = df[df['Size'] == size]

    plt.figure(figsize=(8, 6))
    for algo in ['bfs', 'dfs', 'astar']:
        df_algo = df_size[df_size['Algo'] == algo]

        # Moyenne des temps par nombre de mouvements
        grouped = df_algo.groupby('Moves')['Time(s)'].mean().sort_index()
        plt.plot(grouped.index, grouped.values, label=algo.upper(), marker='o')

    plt.title(f"Temps de résolution pour les puzzles {size}")
    plt.xlabel("Nombre de mouvements (Moves)")
    plt.ylabel("Temps moyen (secondes)")
    plt.legend()
    plt.grid(True)
    plt.tight_layout()

plt.show()
