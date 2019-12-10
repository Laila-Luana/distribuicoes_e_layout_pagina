library(shiny)
library(shinythemes) # para carregar temas
shinyUI(
  fluidPage(
     themeSelector(), # mostra uma lista de temas para escolher. Depois tirar e definir um padrao
    # theme = shinytheme("superhero") # tema definido
    
      titlePanel("Distribuicoes"),
  
  sidebarLayout(
    sidebarPanel(
    radioButtons(inputId="dist",
                 label = "Selecione a distribuico",
                 choices = c("Normal" = "norm",
                             "Uniforme" = "unif",
                             "Log-Normal" = "lnorm")
                 ),
    hr(), # linha
    code("rnorm(100)"), # fonte e cor
    sliderInput(inputId="n",label = "Numero de amostras",
                min = 10, max = 1000, step = 10, value = 10),
    checkboxInput(inputId = "den",label = "Densidade"),
    h5("Criado com",img(src =" https://www.rstudio.com/wp-content/uploads/2014/04/shiny.png"), heigth = "30px")
    ), # adicionar a imagem
    mainPanel(
      plotOutput("hist"),
      verbatimTextOutput("sum")
    )
  )
    
  )

)
