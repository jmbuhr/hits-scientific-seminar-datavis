#!/bin/env python
#%%
import seaborn as sns
import seaborn.objects as so
from palmerpenguins import load_penguins
penguins = load_penguins()

sns.set_theme(style="whitegrid")
tips = sns.load_dataset("tips")

#%%
penguins
#%%

(
so.Plot(penguins, "bill_length_mm", "bill_depth_mm", color="species")
    .add(so.Scatter(fillalpha=1))
    .configure(figsize=(7,4))
    .show()
)


