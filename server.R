shinyServer(function(input, output) {
  
  
  
  
  DATA <- reactive({
    dat <- read.csv("data/DatasetRecruit.csv")
    return(dat)
  })
  
  #依使用者選擇篩選資料
  DATA_SORT<- reactive({
    dat <-DATA()
    #dat=filter(dat,Year == input$Year)
    dat=subset(dat,Year == input$Year)
    dat=dat[order(-dat[,"Year"], dat[,"School"], dat[,"Identity"],dat[,"Sex"],dat[,"MaxScore"]), ]
    return(dat)
  })
  
  output$choose_year <- renderUI({  #這裡是關鍵
    dat = DATA()
    if (is.null(dat)) {return()} else {
       Selectyears <- unique(dat$Year)
      #Selectyears <- colnames(dat)
      selectInput("Year", h4("Choose the year of dataset:"), choices = Selectyears)
    }
  })

  
  output$table <- renderTable({
    dat = DATA_SORT()
  })
  
  output$downloadData <- downloadHandler(
    filename = function() { paste(input$Year,'ScoreRecord.csv', sep='') },
    content = function(con) {
      dat = DATA_SORT()
      if (is.null(dat)) {return()} else {
      write.csv(dat, con)
      }
  })
})
