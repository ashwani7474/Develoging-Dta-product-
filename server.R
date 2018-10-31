library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    
    
    mtcars.cyl.formula <- mtcars[,input$variable1] ~ mtcars[,input$variable2]
    mtcars.cyl.lm <- lm(formula=mtcars.cyl.formula, data=mtcars)
    
    
    # draw the scatter diagram with the specified value of mpg
    plot(mtcars.cyl.formula, data=mtcars, xlab = input$variable1, ylab = input$variable2)
    if (input$Abline){abline(mtcars.cyl.lm,col="Red")}
    
  })
  
})