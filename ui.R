library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Letter Cloud and Prediction"),

  sidebarPanel(
    textInput("text", label = h4("Please Write Something:"), 
              value = "Enter text..."),
    hr(),
    sliderInput("freq", 
                "Minimum Frequency:", 
                min = 1,  max = 50, value = 1),
    sliderInput("max", 
                "Maximum Number of Letters:", 
               min = 1,  max = 26,  value = 26),

    hr(),
    plotOutput('wordplot', width = "100%", height = "300px")
    ),

  mainPanel(
    p("Description: This app calculates the frequency of letters in your input 
      (type or copy/paste in the left input box), and then predicts your next 
      input based on the high
      frequency letters in your text. The counts of the letters are used to form a
      barplot below and a letter cloud plot on the left. You can change the minimum
      frequency and the maximum number of letters in the display of the cloud plot
      using the sliders in the left side panel. Have fun!
      "),
    h4("Prediction of your next input:"),
    verbatimTextOutput('predict'),
    plotOutput('barplot')
  )
)
)
