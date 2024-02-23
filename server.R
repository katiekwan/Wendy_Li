function(input, output) {
  
  
  result_df <- reactive({
    # Initialize an empty data frame to store the result
    result_df <- data.frame(address = character(), cnt_dem = numeric(),
                            rank_ = numeric(), cumulative_sum = numeric(), cumulative_percent = numeric(),
                            Latitude = numeric(), Longitude = numeric())
    
    # Initialize variables
    #result <- character(0)
    cumulative_count <- 0
    target <- input$target_num
    
    # Iterate through the rows and add buildings until the target is reached
    for (i in 1:nrow(df_building)) {
      if (cumulative_count + df_building$cnt_dem[i] <= target) {
        #result <- c(result, df_building$address[i], df_building$rank_[i], df_building$cnt_dem[i])
        result_df <- rbind(result_df, df_building[i, ])
        cumulative_count <- cumulative_count + df_building$cnt_dem[i]
      } else {
        break
      }
    }

  })
  
  
  
  output$mymap <- renderLeaflet({
    data = result_df()
    leaflet(data=result_df) %>%
      addTiles() %>%  # Add default OpenStreetMap map tiles
      addMarkers(lng=~Longitude, lat=~Latitude, popup= ~as.character(address), label=~as.character(rank_))
  }) 
}