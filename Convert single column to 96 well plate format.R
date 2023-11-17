install.packages(readxl)
library(readxl)
library(tidyverse)
library (openxlsx)

# Read the data from Excel
data <- read_excel("C:\\Users\\ywang\\Desktop\\11152023  internalization-1.xls")

# Rename columns
names(data)[1] <- "sample"
names(data)[2] <- "AF647"

# Select relevant columns
data <- data %>% 
  select(sample, AF647) %>% 
  filter(grepl("001", sample))

# Extract the row information
new_data <- data %>% 
  mutate(letter = str_sub(sample, 14, 14),
         number=str_sub(sample, 15, 15))  %>% 
  select(-1) %>% 
  pivot_wider(names_from = number, values_from = AF647)
 
write.xlsx(new_data, "ols.xlsx")


