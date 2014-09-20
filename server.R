shinyServer(function(input, output) {
  
  
  output$BMI <- renderText({
    
    if (input$non_metric == TRUE) {
      BMI <- input$nm_wt*0.4536/(((12*input$nm_ft+input$nm_in)*0.0254)^2)
    }
    
    if (input$non_metric == FALSE) {
      BMI <- input$me_wt / ((input$me_ht)^2)
    }
    
    BMI_comment <- "The person is considered underweight."
 
    if (BMI>=18.5) {
      BMI_comment <- "The person is considered of to be of healthy weight."
    }
    
    if (BMI>=25) {
      BMI_comment <- "The person is considered overweight."
    }
    
    if (BMI>=30) {
      BMI_comment <- "The person is considered obese."
    }
    
    BMI_text <- paste("The BMI is ",
                      as.character(format(BMI, digits=2)),
                      ". ", BMI_comment,
                      sep="")
    
    
    BMI_text
  })
  
  
})