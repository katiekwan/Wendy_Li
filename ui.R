fluidPage(
  titlePanel("List of buildings with targeted voters"),
  sidebarLayout(
    sidebarPanel(
      # selectizeInput(inputId = "party",
      #                label = "Political party",
      #                choices = unique(df$party_full)),
      numericInput(inputId = "target_num",
                     label = "Target Number",
                     value = 10000)),
      mainPanel(leafletOutput("mymap",height = "100vh"))))
