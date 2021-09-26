#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinycustomloader)
library(DT)


# Define UI for application that draws a histogram

navbarPage(
    "LEFON",
    
    # introduction
    
    tabPanel( "Introduction",
              titlePanel("Lefon: Internation Trade Project"),
              sidebarLayout(
                  sidebarPanel("Abstract"),
                  mainPanel(
                      p("Lefon is a Ghana-based international trade company."),
                      p("For our international trade project, we are going to import the goods and services Ghana customers
                        need from China."),
                      p("We have a stong team who understand the business environment in Ghana and china. There are a lot of industrial
                        experts in our team who are capable of providing the high-quality and cheap products to Ghana customers"),
                      p("Also, we would like to utility the big data techniques and machine learning sciences to
                        imporve our commercial abilities to predict the future consumption trend in Ghana.")
                  ),
                  
              ),
              br(),br(),
              # diagram
              sidebarLayout(
                  sidebarPanel("Diagram"),
                  mainPanel(
                      p("404")
                  )
              )
        
    ),
    
    
    
    # Web scrapping
    
    tabPanel( "Jumia",
              fluidPage(
                  # text to introduce our project
                  wellPanel(
                      "We use web scrapping techniques to retrieve data from",
                      a(
                          href = "https://www.jumia.com.gh/",
                          "Jumia"
                      ),
                      p("Click the download button below to download the data to your machine.")
                  ),
                  
                  #download button
                  downloadButton(
                      "download_jumia_ghana",
                      "Download data"
                  ),
                  hr(),
                  withLoader(DTOutput("jumia_table"))
              ))
)
