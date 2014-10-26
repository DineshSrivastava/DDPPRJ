#############################################################################
####                                                                     ####
####                        Developing Data Products                     ####
####                        ------------------------                     ####
####                            October 2014                             ####
####                      Author: Dinesh Srivastava                      ####
####                  Script: Shiny_Project_Assignment1                  ####
####                                                                     ####
#############################################################################

library(shiny) 

fig.width <- 550 
fig.height <- 250 

# Define UI for application that demonstrates the relationship between the standard deviation of a population

shinyUI(pageWithSidebar( 
        
        # Application title
        headerPanel("A Demo of Sampling, Std. Deviation, and Std. Error Concepts", windowTitle = "Shiny Project"), 
        
        # Sidebar with a slider input for the 'Population standard deviation' and 'Number of observations in a sample'
        
        sidebarPanel( 
                h2("Sampling Inputs"),
                
                sliderInput("pop.sd",  
                            strong("Population standard deviation"),  
                            min=0, max=4, value=2, step=.2, ticks=FALSE), 
                br(),
                sliderInput("n.sample", 
                            strong("Number of observations in a sample"), 
                            min=1, max=100, value=20), 
                br(),
                h5("Author: Dinesh Srivastava")
        ), 
        
        # Show all plots generated
        
        mainPanel( 
                h2("Introduction"), 
                div("This example demonstrates the relationship between (1) the standard deviation of a population, (2) the standard deviation and standard error of the mean for a sample drawn from that population, and (3) the expected distribution of means that we would obtain if we took many samples (of the same size) from the population. It is meant to emphasize how the standard error of the mean, as calculated from the sample statistics for a single sample, corresponds to the width of the expected distribution of means (under normal assumptions).", style = "color:blue"), 
                
                h2("Demonstration"), 
                div(plotOutput("population", width=fig.width, height=fig.height),align = "center"), 
                div(plotOutput("sample", width=fig.width, height=fig.height),align = "center"), 
                div(plotOutput("standard.error", width=fig.width, height=fig.height),align = "center") 
        ) 
)) 
