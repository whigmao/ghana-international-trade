#Title : Jumia.com scraping

# Using Smartphone Category as an example

# Load all library
library(tidyverse)
library(rvest)
library(stringi)
library(stringr)
library(dplyr)

# specify the url of the category to scrape
urlbas <- "https://www.jumia.com.gh/smartphones/"

# Get the number of dataset to scrape
products_found <- urlbas %>% read_html() %>% html_nodes(".-gy5.-phs") %>% html_text()

#Split products found
products_found_number <- str_split_fixed(products_found, " ", 2)
products_found_number[1]

# Generate pagination link
products_by_page <- 48
page_number <- round(as.numeric(products_found_number[1]) / products_by_page)

# Get the all links
list_of_pages <- str_c(urlbas,'?viewType=grid&page=', 1:page_number ,'#catalog-listing')
head(list_of_pages, n = 10)

# Create an empty table to store results
result_table <- tibble()

#Start scraping
for(page in list_of_pages){
  page_source <- read_html(page)
  title <- html_nodes(page_source,'.name') %>% html_text()
  price <- html_nodes(page_source,'.prc') %>% html_text()
  temp_table <- tibble(title = title, price = price)
  result_table <- bind_rows(result_table, temp_table)
}

# Remove empty values
result_table <- result_table %>% filter(price != '')

## Export data

write.csv(result_table, paste0("resultdata-", format(Sys.time(), "%d-%b-%Y"),".csv"))

## Thanks