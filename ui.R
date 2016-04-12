
shinyUI(pageWithSidebar(
  headerPanel('國防醫學院大學部軍校正期班級落數落點'),
  sidebarPanel(
    
    # #selectInput("Year", "Choose the year of dataset:",
    #             choices = c("103", "104", "105")),
    downloadButton('downloadData', 'Download'),
    uiOutput("choose_year"),   #這裡是關鍵
    uiOutput("choose_columns2")
  ),
  mainPanel(
    tableOutput('table')
  )
))
