

hr_raw <- read_csv("data/raw/hr_data.csv")

glimpse(hr_raw)
hr_raw |> glimpse()


hr_raw_cleaned_r <- hr_raw |> 
  rename(
    .data = _,
    distance_from_home = distancefromhome,
    employee_count = employeecount,
    performance_rating = performancerating,
    job_role = jobrole
  ) |> 
  dplyr::filter(education != "Below College") |> 
  mutate(yearly_income = monthly_income * 12) |> 
  select(-work_life_balance)

write_csv(hr_raw_cleaned_r, "data/clean/hr_cleaned_r.csv")