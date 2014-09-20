shinyUI(bootstrapPage(
  
  titlePanel("BMI calculator"),
  
  p("Based on your inputs of height and weight, this app will calculate the subjects BMI."),
  
  checkboxInput(inputId = "non_metric",
                label = strong("Check this box if you prefer the traditional U.S. measures (pound and feet)"),
                value = FALSE),
  
  
  # Display this only if the density is shown
  conditionalPanel(condition = "input.non_metric == true",
                   sliderInput(inputId = "nm_ft",
                               label = "Height (feet):",
                               min = 1, max = 7, value = 5, step = 1),
                   sliderInput(inputId = "nm_in",
                               label = "Height (inches):",
                               min = 0, max = 11, value = 8, step = 1),
                   sliderInput(inputId = "nm_wt",
                               label = "weight (pounds):",
                               min = 50.0, max = 350.0, value = 180, step =0.5)
                   
  ),
  
  conditionalPanel(condition = "input.non_metric == false",
                   sliderInput(inputId = "me_ht",
                               label = "Height (meters):",
                               min = 0.60, max = 2.25, value = 1.80, step = 0.01),
                   sliderInput(inputId = "me_wt",
                               label = "weight (kg):",
                               min = 25.0, max = 150.0, value = 78, step = 0.5)
                   
  ),
  
  textOutput("BMI"),
  
  p(),
  p(),
  
  em("Please understand that this app has been launched solely for eductional purposes. Do not use it to actually evaluate a person's medical condition."),
  
  p(),
  
  em("Please refer to "),
  a(href="http://www.cdc.gov/obesity/adult/defining.html", "this link with the CDC"),
  em("for more information on obesity and overweight.")
))