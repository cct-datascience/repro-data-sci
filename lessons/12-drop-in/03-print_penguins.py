import pandas as pd
import seaborn as sns

penguins = pd.read_csv("penguins_dat_from_r.csv")

penguin_plot = sns.catplot(data = penguins, x = "species", y = "bill_length_mm")

penguin_plot.savefig("penguin_plot.jpg")

print("Saved penguins plot")
