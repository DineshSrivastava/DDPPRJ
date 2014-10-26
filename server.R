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

# Define server logic required to demonstrates the relationship between the standard deviation of a population
shinyServer(function(input, output) { 
        
        output$population <- renderPlot({ 
                x <- seq(-10, 10, length.out=1000) 
                pdf <- dnorm(x, 0, input$pop.sd) 
                plot(x, pdf, type="l", col="blue", lwd=3, main="(1) Population", frame=FALSE) 
        }) 
        
        output$sample <- renderPlot({ 
                x <- rnorm(input$n.sample, 0, input$pop.sd) 
                x <- x[x > -10 & x < 10] 
                bins <- hist(x, breaks=seq(-10, 10, 1), col="yellow", xlim=c(-10, 10), 
                             main="(2) One Sample from the Population") 
                
                # Serverside Calculations used is graphs displayed on through the ui.R
                
                annot.height <- max(bins$count) / 2 
                sd.x = sd(x) 
                sem.x = sd(x) / sqrt(length(x)) 
                lines(c(-sd.x, sd.x), rep(annot.height, 2), lwd=6, col="grey") 
                lines(c(-sem.x, sem.x), rep(annot.height, 2), lwd=5, col="red") 
                
                legend(-10, max(bins$count), c("+/- sd", "+/- sem"), 
                       col=c("grey", "red"), lty=c(1, 1), lwd=c(4, 4), 
                       box.lwd = 0, box.col = "white",bg = "white") 
                
                rug(x, col="blue", lwd=2, ticksize=.05) 
                
        }) 
        
        output$standard.error <- renderPlot({ 
                sem <- input$pop.sd / sqrt(input$n.sample) 
                x <- rnorm(10000, 0, sem) 
                hist(x, col="yellow", xlim=c(-10, 10), freq=FALSE, 
                     main="(3) Distribution of Means from Many Samples") 
                x.pos <- seq(-10, 10, length.out=1000) 
                pdf <- dnorm(x.pos, 0, sem) 
                lines(x.pos, pdf, col="blue", lwd=2) 
                annot.height <- max(pdf) / 2 
                lines(c(-sem, sem), rep(annot.height, 2), lwd=4, col="red") 
                
                legend(-10, max(pdf), "+/- sd", 
                       col="red", lty=1, lwd=4, 
                       box.lwd = 0, box.col = "white",bg = "white") 
                
        }) 
}) 
