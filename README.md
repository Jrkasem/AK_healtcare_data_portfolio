import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Read the dataset
dataset_path = r"C:\Users\Dell\Downloads\Lown_Hospital_Index_Equity_GradeRank.xlsx"
df = pd.read_excel(dataset_path)

# Perform exploratory data analysis
# Display basic information about the dataset
print(df.info())

# Summary statistics
print(df.describe())

# Check for missing values
print(df.isnull().sum())

# Visualize distribution of Lown Composite Overall Rank
sns.histplot(df['Tier 1_Lown Composite Overall Rank'], kde=True)
plt.xlabel('Lown Composite Overall Rank')
plt.ylabel('Count')
plt.title('Distribution of Lown Composite Overall Rank')
plt.show()

# Correlation heatmap
corr = df.corr()
sns.heatmap(corr, annot=True, cmap='coolwarm')
plt.title('Correlation Heatmap')
plt.show()

# Explore equity-related metrics
# Boxplot of Pay Equity Rank by Hospital Type
sns.boxplot(data=df, x='Type_For Profit', y='Tier 3_Pay Equity Rank')
plt.xlabel('Hospital Type (For Profit)')
plt.ylabel('Pay Equity Rank')
plt.title('Pay Equity Rank by Hospital Type')
plt.show()

# Bar plot of Community Benefit Grade by Ownership Type
sns.barplot(data=df, x='Type_NonProfit', y='Tier 3_Community Benefit Grade')
plt.xlabel('Ownership Type (Non-Profit)')
plt.ylabel('Community Benefit Grade')
plt.title('Community Benefit Grade by Ownership Type')
plt.show()
