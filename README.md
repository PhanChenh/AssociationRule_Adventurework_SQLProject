# Project Title: Analyzing AdventureWorks Dataset with Association Rule Mining in SQL (2011-2014)

## Table of Contents
- [Overview](#overview)
- [Dataset](#dataset)
- [Objective](#objective)
- [Analysis Approach](#analysis-approach)
- [Association Rule Metrics](#Association-Rule-Metrics)
- [Key Findings](#key-findings)
- [How to Use](#how-to-use)
- [Technologies Used](#technologies-used)
- [Results](#results)
- [Recommendation](#recommendation)
- [Contact](#contact)


## Overview:

This project analyzes the AdventureWorks2022 dataset using Association Rule Mining in SQL to uncover purchasing patterns and product relationships. Association rules help identify frequently bought-together items, enabling businesses to optimize promotions, product placements, and cross-selling strategies.

## Dataset

The analysis is based on the AdventureWorks2022, obtained from Microsoft Learn:

🔗 AdventureWorks sample Databases
- Source: [Microsoft Learn](https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2022.bak)
- Time Period Covered: 2011-2014

This dataset contains transactional data from AdventureWorks, a fictional retail company, including sales, products, and customer orders.

## Objective

The objective of this project is to clean and prepare the AdventureWorks2022 dataset for association rule mining, identify frequently purchased item combinations, calculate key association metrics such as support, confidence, and lift to assess the strength of these relationships, and interpret the results to generate actionable insights that can inform product recommendations, cross-selling strategies, and promotional activities.

## Analysis Approach
1. Data Preparation: Format the dataset for association rule mining.

2. Identify Frequent Itemsets: Extract commonly purchased product combinations.

3. Compute Support, Confidence, and Lift: Assess the strength of relationships.

4. Interpret Results: Provide insights for sales strategies.

5. Recommendations: Based on the analysis, strategic recommendations were provided to enhance product bundling, optimize cross-selling opportunities, and improve targeted marketing efforts. These insights aim to maximize sales, increase customer engagement, and drive business growth

## Association Rule Metrics

- Support: Frequency of itemset occurrence in total transactions.

    Formula: Support(A→B) = Frequency(A,B) / Total Transactions

- Confidence: Likelihood of B being purchased when A is bought.

    Formula: Confidence(A→B) = Frequency(A,B) / Frequency(A)

- Lift: Strength of association beyond random chance.

    Formula: Lift(A→B) = Support(A→B) / (Support(A) × Support(B))

## Key Findings

High-Lift Associations 
- Product Pair: Women's Tights, S & Women's Tights, L
    + Lift = 66.78 (Very strong correlation).
    + Recommendation: Offer bundle discounts for both sizes.
- Product Pair: Road-650 Red, 60 & Road-650 Black, 52
    + Support = 0.0163 (Frequent combination).
    + Recommendation: If one sells well, promote the other.

Moderate Confidence & Lift
- Product Pair: Road-650 Red, 52 & Road-650 Black, 58
    + Confidence = 74%, Lift = 50.68.
    + Recommendation: Feature these together in campaigns.

High Support, Moderate Lift
- Product Pair: Touring Tire Tube & Touring Tire
    + Support = 0.0473, Lift = 18.27.
    + Recommendation: Upsell as add-ons during checkout.

## How to use
1. Restore database in SSMS as guided in Mirosoft Learn [Restore to SQL Server](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms)
2. Using SQL Server Management Studio (SSMS) to execute SQL queries

## Technologies Used
- SQL code: SQL queries were designed to preprocess data, extract transactional patterns, identify frequently purchased items, and calculate Support, Confidence, and Lift, enabling insights for product bundling and cross-selling strategies.

## Results 
- The results are stored in the file [AssociationRule_result_Adventurework.csv](AssociationRule_result_Adventurework.csv)
- The result is filtered based on the following conditions:
    Confidence > 0.5,
    PairSupport > 0.01,
    PS_B.Support > 0.01.

These conditions ensure that the association rules represent strong, reliable, and frequent product pairings. The results are valuable as they highlight associations that are both statistically significant (with high confidence) and frequent enough (with sufficient support) to be practical for business decisions.

## Recommendation

1. Create Targeted Marketing Campaigns for High-Lift Pairs:
- For items like Women’s Tights (S and L), which have an extremely high lift, you could bundle them together with targeted ads or cross-sell offers to increase customer purchases.

2. Offer Promotions or Discounts for Frequent Pair Purchases:
- For items that have high pair support and moderate confidence (e.g., Road-650 Red and Road-650 Black), use promotions to encourage customers to buy the full set. This could be a "buy one, get one discount" or offering a slight discount for purchasing both items together.

3. Highlight Complementary Products:
- Products like the Touring Tire Tube and Touring Tire can be marketed in "complete the set" offers or upselling at checkout. This works well in scenarios where customers may forget to purchase an accessory or related product.

4. Reevaluate Bundling for Low Lift Pairs:
- Items with lower lift (e.g., Classic Vest, M & Bike Wash) should not be aggressively bundled but could be marketed as separate complementary items or placed in categories where cross-promotion makes sense.

5. Optimize Product Placement Based on Buying Patterns:
- Analyze customer buying behavior further to identify optimal placement on e-commerce sites—products with higher confidence might benefit from being placed near each other on product pages.


## Contact

📧 Email: pearriperri@gmail.com

🔗 [LinkedIn](https://www.linkedin.com/in/phan-chenh-6a7ba127a/) | Portfolio
