library(assertr)
library(skimr)


# Gereinigter Datensatz laden ---------------------------------------------
dframe <- read_csv("data/clean/hr_cleaned.csv") 


# Datensatz ansehen -------------------------------------------------------
glimpse(dframe)
skim(dframe)


# Data Quality Checks ausführen -------------------------------------------
dframe |> 
  verify(has_only_names("id", "age", "department", "distance_from_home",
                        "education", "employee_count", "gender",
                        "job_role", "job_satisfaction", "marital_status",
                        "monthly_income", "yearly_income", 
                        "num_companies_worked", "performance_rating",
                        "total_working_years", "years_at_company",
                        "years_since_last_promotion")) |>
  verify(has_all_names("id", "age")) |> 
  verify(age >= 14) |> 
  assert(is_uniq, id) |> 
  assert_rows(num_row_NAs, within_bounds(0, 1), everything()) |> 
  assert(in_set("Single", "Married", "Divorced"), marital_status) |> 
  assert(within_bounds(14, 90), age) 

