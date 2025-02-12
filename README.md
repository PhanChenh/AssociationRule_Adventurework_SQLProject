# Project Title: Analyzing AdventureWorks with Association Rule Mining in SQL

## Project Overview:

Dataset: Dataset: AdventureWorks2022.bak (https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms)

Association rules are a fundamental concept in data mining, often used to discover relationships or patterns in large datasets, particularly in market basket analysis. The goal is to identify how items or events are related to each other, which can then inform decision-making, promotions, product placements, and more.

## Objectives:


## Project Structure:
1. Data Preparation – Ensure the dataset is formatted for association rule mining.
2. Identify Frequent Itemsets – Extract commonly purchased item combinations.
3. Calculate Support, Confidence, and Lift – Measure the strength of associations.
4. Interpret Results – Derive actionable insights for product recommendations.

## An association rule is an implication of the form:
A → B
- This means if item A is purchased, then item B is likely to be purchased as well. In other words, it expresses a relationship between two products that tend to occur together.

For example: "If a customer buys a laptop, they are likely to also buy a laptop bag."

Components of Association Rules:
- Antecedent (LHS - Left-Hand Side): This is the item or set of items on the left-hand side of the rule. For example, in the rule "A → B", A is the antecedent.
- Consequent (RHS - Right-Hand Side): This is the item or set of items on the right-hand side of the rule. In the rule "A → B", B is the consequent.
- Support: The support of a rule represents the frequency or proportion of transactions that contain both the antecedent (A) and consequent (B).
- Mathematically: Support(A→B) = Frequency(A,B) / N(total distinct orders)

=> Interpretation: This tells you how often the rule appears in the dataset. For instance, a rule with high support means the combination of items (A and B) happens frequently across transactions.
- Confidence: The confidence of a rule measures the likelihood that the consequent (B) will occur when the antecedent (A) occurs.
- Mathematically: Confidence(A→B) = frequency(A,B)/ frequency(A)

=> Interpretation: This tells you how often B appears when A is purchased. A confidence of 0.7 means that when A is purchased, 70% of the time B is also purchased.
- Lift: The lift of a rule compares the observed frequency of the item pair occurring together to the expected frequency if they were independent. A lift greater than 1 indicates that the items are positively correlated and occur together more often than expected.
- Mathematically: Lift(A→B) = Support(A→B) / (Support(A) × Support(B)

=> Interpretation: If Lift > 1, the products are likely to be purchased together more often than by chance. If Lift < 1, they are likely to be bought independently.

## Example of Association Rule:

Imagine a retail store:
- Support: 30% of customers buy both "milk" and "bread".
- Confidence: When a customer buys milk, 80% of the time they also buy bread.
- Lift: The probability of buying milk and bread together is 2.5 times higher than if the two were bought independently.

### Why are Association Rules Important?
- Market Basket Analysis: Association rules are widely used in retail to analyze purchasing behavior. It helps businesses understand product combinations that are frequently bought together.

Example: "Customers who buy wine also tend to buy cheese."
- Cross-Selling & Up-Selling: By identifying strong associations, retailers can suggest additional products to customers, increasing sales.

Example: Recommending a printer when a customer buys a laptop.
- Product Placement: Understanding associations can help businesses place related products near each other in a store or on an e-commerce website to maximize sales.

Promotions and Discounts: Identifying patterns can lead to targeted promotions. For example, offering discounts on products that are often bought together.

### Challenges of Association Rules:
- Overfitting: Sometimes rules may seem statistically significant but may not have real-world relevance.
- Scalability: As the number of items in a dataset increases, the number of potential associations grows exponentially, making computations more complex.
- Relevance: A rule with high support might not always be useful if it does not align with business goals.

----


