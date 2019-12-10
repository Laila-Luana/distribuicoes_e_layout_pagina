shinyServer(function(input,output){
  d<-reactive({
    x<-switch(input$dist,
           "norm" = rnorm,
           "unif" = runif,
           "lnorm" = rlnorm
           )
    x(input$n)
  })
  
  output$hist<-renderPlot({
    if(input$den==TRUE){
      hist(d(),col = "red",border = "white",freq = FALSE)
      lines(density(d()))
    }else{
      hist(d(),col = "red",border = "white",freq = FALSE)
    }  
    
    
    output$sum<-renderPrint({
      summary(d())
    })
    
})
  
  
  
})