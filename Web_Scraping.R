#install.packages("dplyr")
#install.packages("rvest")
#install.packages("httr")
#install.packages("jsonlite")
#install.packages("RSelenium")

library(dplyr)
library(rvest)
library(httr)
library(jsonlite)
library(RSelenium)

link = "https://en.wikipedia.org/wiki/list_of_ISO_3166_country_codes"
page = read_html(link)
element <- page %>% html_element("table.sortable")

df <- html_table(element, header =FALSE)

names(df) <- df[2,]

df = df[-1:-2,]

write.csv(df, "iso_codes.csv")
