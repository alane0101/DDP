library(shiny)
shinyUI(fluidPage(
  titlePanel("Estimate Your Car's MPG!"),
  sidebarLayout(
    sidebarPanel(
      h3("Input your vehicle's weight and number of cylinders:"),
      sliderInput("wt", "Weight in lbs:", min = 1000, max = 8000, value = 2000, round = TRUE, ticks = TRUE),
      selectInput("cyl", "Cylinders:", c(4, 6, 8), selected = NULL, multiple = FALSE,
                  selectize = FALSE),
      submitButton("Submit")
    ),
    mainPanel(
      h2("Estimated MPG:"),
      h1(textOutput("mpg"))
    )
  )
  ))
