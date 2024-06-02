import pandas as pd

# Read the CSV file
df = pd.read_csv("names_and_embeddings.csv")

# Remove duplicates from the 'name' column
df.drop_duplicates(subset="name", keep="first", inplace=True)

# Write the cleaned data back to the CSV file
df.to_csv("names_and_embeddings.csv", index=False)
