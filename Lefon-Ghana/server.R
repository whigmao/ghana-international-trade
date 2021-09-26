#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinycustomloader)
library(tidyverse)
library(DT)


# Define server logic

# load data
countries <- read_csv("data/resultdata-26-9月-2021.csv")

# Define server logic required to show output
function(input, output) {
    # 1. data page
    # 1.1 download button
    output$download_jumia_ghana <- downloadHandler(
        filename = function() {
            paste0(Sys.Date(), "_jumia_ghana.csv")
        },
        content = function(file) {
            countries %>%
                write_csv(file)
        }
    )
    # 1.2 data table
    output$jumia_table <- renderDT({
        countries %>%
            select(title, price) %>%
            arrange(desc(title))
    }, rownames = FALSE,extensions = "Buttons",
    options = list(
        buttons = c("excel", "pdf"),
        dom = "Bftip"))
    }
