
# Randomization Check Analysis
# Price Comparison T-test between Treatment and Control Groups
t_test_result <- t.test(price ~ treatment_group, data = randomization_data)
print(t_test_result)  # p-value ≈ 0.7

# Product Category Distribution Test
# Create contingency table of ProdCat and Vid
contingency_table <- table(randomization_data$ProdCat, randomization_data$Vid)
fisher_test_result <- fisher.test(contingency_table)
print(fisher_test_result)  # p-value ≈ 0.8

# F-test for Price Variance Comparison
var_test_result <- var.test(price ~ treatment_group, data = randomization_data)
print(var_test_result)

# Difference in Means Analysis
# Calculate mean sales for treatment and control groups
sales_summary <- aggregate(WeeklySales ~ Vid, data = focal_sales_data, 
                         FUN = function(x) c(mean = mean(x), sd = sd(x)))
print(sales_summary)
# Results show means of approximately:
# Vid = 0: 102 units
# Vid = 1: 122.7 units

# Regression Analysis for Focal Products
# Basic regression model for focal product sales
focal_model <- lm(WeeklySales ~ Vid + PriceDiscWk + EmailWk + CatalogWk + 
                  HomePgWk + CatPgWk, data = focal_sales_data)
summary(focal_model)

# Regression Analysis for Coordinating Products

# Full model for coordinating product sales
cp_model_full <- lm(CpSales ~ VidWk + CpPriceDiscWk + FpPriceDiscWk + 
                    CpEmailWk + FpEmailWk + CpCatalogWk + FpCatalogWk + 
                    CpHomePgWk + FpHomePgWk + CpCatPgWk + FpCatPgWk, 
                    data = cp_analysis_data)
summary(cp_model_full)

# Reduced model with significant variables only
cp_model_reduced <- lm(CpSales ~ VidWk + CpPriceDiscWk + FpPriceDiscWk + 
                      CpEmailWk + FpCatalogWk + CpHomePgWk + FpHomePgWk + 
                      CpCatPgWk, data = cp_analysis_data)
summary(cp_model_reduced)

# Standardized beta coefficients
library(lm.beta)
std_beta_cp <- lm.beta(cp_model_reduced)
summary(std_beta_cp)

# Interaction Effects Analysis
# Focal product interaction model
focal_interaction_model <- lm(WeeklySales ~ Vid + PriceDiscWk + EmailWk + 
                            CatalogWk + HomePgWk + CatPgWk +
                            Vid:PriceDiscWk + Vid:EmailWk + Vid:CatalogWk + 
                            Vid:HomePgWk + Vid:CatPgWk, 
                            data = focal_sales_data)
summary(focal_interaction_model)

# Coordinating product interaction model
cp_interaction_model <- lm(CpSales ~ VidWk + CpPriceDiscWk + FpPriceDiscWk + 
                         CpEmailWk + FpEmailWk + CpCatalogWk + FpCatalogWk +
                         CpHomePgWk + FpHomePgWk + CpCatPgWk + FpCatPgWk +
                         VidWk:CpPriceDiscWk + VidWk:FpPriceDiscWk + 
                         VidWk:CpEmailWk + VidWk:FpEmailWk + 
                         VidWk:CpCatalogWk + VidWk:FpCatalogWk +
                         VidWk:CpHomePgWk + VidWk:FpHomePgWk + 
                         VidWk:CpCatPgWk + VidWk:FpCatPgWk,
                         data = cp_analysis_data)
summary(cp_interaction_model)

# Reduced coordinating product interaction model (after removing CpCatalogWk interaction)
cp_interaction_model_reduced <- lm(CpSales ~ VidWk + CpPriceDiscWk + FpPriceDiscWk + 
                                CpEmailWk + FpEmailWk + CpHomePgWk + FpHomePgWk + 
                                CpCatPgWk + FpCatPgWk +
                                VidWk:CpPriceDiscWk + VidWk:FpPriceDiscWk + 
                                VidWk:CpEmailWk + VidWk:FpEmailWk +
                                VidWk:CpHomePgWk + VidWk:FpHomePgWk + 
                                VidWk:CpCatPgWk + VidWk:FpCatPgWk,
                                data = cp_analysis_data)
summary(cp_interaction_model_reduced)

