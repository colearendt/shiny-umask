library(shiny)

ui <- fluidPage(

    titlePanel("Old Faithful Geyser Data"),

    sidebarLayout(
        sidebarPanel(
            textInput('file_path', 'File Path:', value = "/tmp/file.csv"),
            actionButton('action', 'Action')
        ),

        mainPanel(
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    observeEvent(input$action, {
        write.csv(iris, input$file_path)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
