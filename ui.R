library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Linear model of mpg outcome"),
  
  # Sidebar with a slider input 
  sidebarLayout(
    sidebarPanel(
      h4("Select a variable and submit to calculate coefficients"),
      selectInput("variable","Variable:", c("cyl","qsec","am")),
      submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Linear regression of mpg by selected variable"), 
      plotOutput("plot1")
    )
  )
))
