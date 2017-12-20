library(shiny)

# Define server logic required
shinyServer(function(input, output) {
  data(mtcars)
  model<- reactive({
    varInput<-input$variable
    colnum<-match(varInput,names(mtcars))
    df<-data.frame(mpg=mtcars$mpg,mtcars[,colnum])
    colnames(df)[2]<-varInput
    fit<-lm(mpg~.,data=df)
  })   

  output$plot1<-renderPlot({
    varInput<-input$variable
    colnum<-match(varInput,names(mtcars))
    df<-data.frame(mpg=mtcars$mpg,mtcars[,colnum])
    colnames(df)[2]<-varInput
    plot(df[,2],df$mpg,xlab=colnames(df)[2],
         ylab="mpg")
    abline(model(),col="red",lwd=2)
  })
  
})
