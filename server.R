library(shiny)
library(wordcloud)

shinyServer(function(input, output) {
  
  dataset <- reactive({
    ss <- toupper(input$text)                     ## convert the text to upper case
    mm <- as.matrix(table(unlist(strsplit(ss, NULL))))   ## split the text to letters
    v <- sort(rowSums(mm), decreasing = TRUE)        ## sort the frequency table
    v <- v[names(v) %in% LETTERS]                    ## Keep only letters
    v
  })
  
  wordcloud_rep <- repeatable(wordcloud)
  
  output$wordplot <- renderPlot( {                ## wordcloud plot
   if(length(dataset()) > 0) wordcloud_rep(names(dataset()), dataset(), scale=c(8,0.3),
                  min.freq = input$freq, max.words=input$max,
                  colors=brewer.pal(8, "Dark2"))        
  })
  
  output$barplot <- renderPlot({                  ## Barplot
    colors = c("red", "yellow", "green", "violet", "orange", "blue", "pink", "cyan") 
    if(length(dataset()) > 0) barplot(dataset(), col = colors, xlab = "Input Letters", 
                                      ylab = "Counts")
  })
  
  output$predict <- renderText({                  ## prediction result
    names(dataset()[dataset()==max(dataset())])
  })
  
})
