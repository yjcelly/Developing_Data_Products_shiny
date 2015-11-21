library(shiny)

##record the input operation, will be + - * /
operation <<- ""

##record the input num and operation string 
curStr <<- ""

##copy the string from curStr, but must cut the last operation
eval_str <<- ""

###0 means we should update the operation
###1 means we should update the num
updateIsOperation <<- 1

##record the update style: num input update and operation input update
updateOperation <<- 0
updateNum <<- 0


##record the num of button num
curRightNum <<- 0

##record the value of input num
curValue <<- 0


##record the click num of the four button (+-*/)
curAddNum <<- 0
curDecNum <<- 0
curMulNum <<- 0
curDivNum <<- 0


###get the input num and input operation
###accept the repeat input num and operation
GetOperationNum <- function(input)
{
  #if(updateIsOperation == 0)
  {  
    if(input$Add >= (curAddNum +1 ) )
    {
      operation <<- " +"
      curAddNum <<- input$Add
      updateOperation <<- 1
    }
    if(input$Dec >= (1+curDecNum)  )
    {
      operation <<- " -"
      curDecNum <<- input$Dec
      updateOperation <<- 1
    }
    if(input$Mul >= (1+curMulNum)  )
    {
      operation <<- " *"
      curMulNum <<- input$Mul
      updateOperation <<- 1
    }
    if(input$Div >= (1+curDivNum)  )
    {
      operation <<- " /"
      curDivNum <<- input$Div
      updateOperation <<- 1
    }
  }
  #if(updateIsOperation == 1)
  {
    if( input$AddNum >= (1+curRightNum) )
    {
      curValue <<- paste(" ",input$innum)
      curRightNum <<- input$AddNum 
      updateNum <<- 1
      #updateIsOperation <<- 0
    }
  }
    
   ###update the input operation
  if(updateOperation == 1)
  {
    curStr <<- paste(curStr,operation)
    updateIsOperation <<- 1
    updateOperation <<- 0
  }
  
  ##update the input num
  if( updateNum == 1)
  {
    curStr <<- paste(curStr,curValue)
    updateNum <<- 0
    updateIsOperation <<- 0
    
    ##copy the string when the last input is num
    eval_str <<- curStr
  }
  #operation
}

shinyServer(
function(input, output) {
  
  ###show all the input 
  output$ShowOperation <- renderText({
    GetOperationNum(input)
    curStr
  })
  
  output$outnum <- renderPrint({input$innum})
  
  ##show the result
  output$Result <- renderText({
    GetOperationNum(input)
    eval(parse(text=eval_str))
  })
  
}
)