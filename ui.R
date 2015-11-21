library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Simple Calculator"),
  sidebarPanel(
    h2('Operation:'),
    numericInput('innum', 'Numeric input', 0,width = '100px'),
    actionButton('AddNum','Num'),
    
    
    actionButton("Add", "+"),actionButton("Dec", "-"),actionButton("Mul", "*"),actionButton("Div", "/"),
    
    p('ShowInput'),    textOutput('ShowOperation'),
    p('Result'),    textOutput('Result')
  ),
  mainPanel(
    h3('Usage Help'),
    p('1.input any numeric in the numeric input text, then click the Button of Num'),
    p('2.enter the any of operation + - * / '),
    p('3.The result of the input expression will show in the Result text dialog'),
    p('warnning: the input should be the style:  num operation num. \"10+20\" is accept, but \"10+*20\" and \"10+20 20\" will generate errors.'),
    p('example: \"100+100*10+200\" will get 1300')
    #h4('log'),
    #verbatimTextOutput("log")
    
  )
))