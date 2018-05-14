shinyUI(
  fluidPage(
    
    fluidRow(column(10,
    headerPanel("Student Guider Application For Selecting Major"),
    
    div(class = "col-sm-12",
        uiOutput("uiLogin"),
        style = "text-align: left; max-width:500px;",
        textOutput("pass"),
        tags$head(tags$style("#pass{color: red;"))
    ),
    div(class = "logininfo",
        uiOutput("userPanel"),
        style = "text-align: right; position:relative; top: 5%;"
    ),
    hr()
    )),    
    
    fluidRow(
      column(5,
             div(class = "span1",      
                 uiOutput("obs")
             )
      ),
      column(6,
             div(class = "congrats",      
                 uiOutput("congrats"),
                 style = "color: green; font-size: 20px; font-style: bold;"
                 ),
             
             br(),
             br(),
             
             div(class = "intro",      
                 uiOutput("intro"),
                 style = "color: black; font-size: 15px; font-style: bold;"
             ),
             
             div(class = "results",      
                 uiOutput("results"),
                 style = "color: red; font-size: 15px; font-style: bold;"
             )
      )
    )
    
    
  )
)
