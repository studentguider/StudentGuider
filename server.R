library(shiny)

########################################################

shinyServer(function(input, output, session) {
  
  USER <- reactiveValues(Logged = FALSE , session = session$user) 
  
  source("./Login.R",  local = TRUE)
  source("./rf.R",  local = TRUE)
  
 
  output$obs <- renderUI({    
    if (USER$Logged == TRUE) {      
      list(
        selectInput(inputId = "gender", label = "Select your gender:",
                    choices = c("Male", "Female"),
                    selected = "Male"),
        sliderInput(inputId = "gat", 
                    label = "Select your General Aptitude Test Results:", 
                    min = 1, max = 100, 
                    step = 1,
                    value = 70),
        
        sliderInput(inputId = "schAch",
                    label = "Select your Scholastic Achievement Admission Test Results:",
                    value = 70,
                    step = 1,
                    min = 1,
                    max = 100),
        
        sliderInput(inputId = "grade", 
                    label = "Select your Grade Score:", 
                    min = 0, max = 100, 
                    step = 1,
                    value = 70),
        
        actionButton('calc', 'Send Enquiry')
      )
    }                 
  })   
  
  df1 <- eventReactive(input$calc, {
      calculateNew(input$gender, input$gat, input$schAch, input$grade)
  })
  df2 <- eventReactive(input$calc, {
    return("Based on your results we recommend that you study :")
  })
  
  output$congrats <- renderText({
    if (USER$Logged == TRUE) {
      "Congratulations on completing High School"
    }
  })
  
  output$intro <- renderText({
    if (USER$Logged == TRUE) {
      df2()
      
    }
  })
  
  output$results <- renderText({
    if (USER$Logged == TRUE) {
      df1()
    }
  })
  
})
