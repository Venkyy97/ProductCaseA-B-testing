# ProductCaseA-B-testing

Product Video Impact Analysis on Sales
Overview
This repository contains an analysis of the impact of product videos on both focal and coordinating product sales in an e-commerce context. The study uses statistical methods to evaluate the effectiveness of video marketing and its interaction with other promotional strategies.
Key Findings
1. Randomization Validation

No significant difference in mean prices between treatment and control groups (p-value = 0.7)
Product category distribution is independent of treatment assignment (p-value = 0.8)
Variance in product prices is consistent across treatment and control groups
Successful randomization confirms the validity of the experimental design

2. Treatment Effects
Focal Products

Difference-in-means estimate: +20.7 units in weekly sales
Regression-based estimate: +15.675 units in weekly sales
The difference between estimates indicates the importance of controlling for other promotional variables

Coordinating Products

Regression-based estimate: +18 units in weekly sales
Treatment effect is stronger on focal products (9 units higher) compared to coordinating products
Analysis controlled for various marketing promotions and price discounts

3. Interaction Effects
Focal Products

Positive incremental effects when combined with:

Price discounts
Category page promotions


Negative interaction with catalog promotions

Coordinating Products

Positive incremental effects with focal product catalog promotions
Initial negative effect with coordinating product catalog promotions (limited sample size)
More neutral effects after controlling for low interaction frequencies

Methodology
Data Analysis Techniques

Randomization Checks

Two-sample t-tests
Fisher's exact test
F-test for variance comparison


Treatment Effect Estimation

Difference-in-means analysis
Multiple linear regression
Standardized beta coefficient comparison


Interaction Analysis

Multiple regression with interaction terms
Reduced model analysis for significant factors



Statistical Tools

R Statistical Software
Key packages:

Base R for statistical tests
lm for linear regression
lm.beta for standardized coefficients

Requirements

R version 3.6 or higher
Required R packages:
rCopyinstall.packages(c("lm.beta", "tidyverse", "stats"))



Business Implications

Video Marketing Strategy

Product videos significantly boost sales
Stronger impact on featured products
Positive spillover effects on related products


Promotional Integration

Combine videos with price discounts for maximum impact
Strategic placement on category pages
Careful consideration needed for catalog promotion integration


Resource Allocation

Invest in video production for key products
Focus on products with strong coordination potential
Optimize promotional mix based on interaction effects
