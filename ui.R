library(shiny)
shinyUI(fluidPage(
  headerPanel("Simple Calculator"),
  sidebarPanel(
    h2('Operation:'),
    numericInput('innum', 'Numeric input', 0),
    actionButton('AddNum','Num'),
    
    
    actionButton("Add", "+"),actionButton("Dec", "-"),actionButton("Mul", "*"),actionButton("Div", "/"),
    
    h4('ShowInput'),    textOutput('ShowOperation'),
    h4('Result'),    textOutput('Result')
  ),
  mainPanel(
    h3('Usage Help'),
    h4('1.input any numeric in the numeric input text, then click the Button of Num'),
    h4('2.enter the any of operation + - * / '),
    h4('3.The result of the input expression will show in the Result text dialog'),
    h3('warnning: the input should be the style:  num operation num. \"10+20\" is accept, but \"10+*20\" and \"10+20 20\" will generate errors.'),
    h3('example: \"100+100*10+200\" will get 1300')
    #h4('log'),
    #verbatimTextOutput("log")
    
  )
))