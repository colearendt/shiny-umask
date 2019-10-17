library(shiny)

ui <- fluidPage(

    titlePanel("Old Faithful Geyser Data"),

    sidebarLayout(
        sidebarPanel(
            textInput('file_path', 'File Path:', value = "/tmp/file.csv"),
            actionButton('action', 'Action'),
            actionButton('remove', 'Remove')
        ),

        mainPanel(
            h2("output of `ls -lha`"),
            textOutput("ls_output"),
            br(),
            h2("output of `umask`"),
            textOutput("umask_output")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    observeEvent(input$action, {
        write.csv(iris, input$file_path)
    })
    
    observeEvent(input$remove, {
        unlink("/tmp/file.csv")
    })
    
    output$ls_output <- renderText({
        tmp <- input$action
        tmp2 <- input$remove
        var <- system("ls -lha /tmp/file.csv", intern = TRUE)
        var
    })
    
    output$umask_output <- renderText({
        tmp <- input$action
        tmp2 <- input$remove
        var <- system("umask", intern = TRUE)
        var
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
