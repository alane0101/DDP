library(shiny)
shinyServer(function(input, output) {
  data("mtcars")
  
  cyl4 <- mtcars[mtcars$cyl == 4,]
  cyl6 <- mtcars[mtcars$cyl == 6,]
  cyl8 <- mtcars[mtcars$cyl == 8,]
  
  model4 <- lm(mpg ~ wt, data = cyl4)
  
  model6 <- lm(mpg ~ wt, data = cyl6)
  
  model8 <- lm(mpg ~ wt, data = cyl8)
  
  pred_mpg <- reactive({
    wtInput <- input$wt / 1000
    cylInput <- input$cyl
    print(wtInput)
    print(cylInput)
    
    if(input$cyl == 4){
      return(predict(model4, newdata = data.frame(wt = wtInput), type = "response"))
    }
    
    if(input$cyl == 6){
      return(predict(model6, newdata = data.frame(wt = wtInput), type = "response"))
    }
    
    if(input$cyl == 8){
      return(predict(model8, newdata = data.frame(wt = wtInput), type = "response"))
    }
    
  })
  
  output$mpg <- renderText({
    mpg <- pred_mpg()
    return(mpg)
  })
})