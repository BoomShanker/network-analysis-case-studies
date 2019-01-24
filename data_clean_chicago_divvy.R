# Load packages
library(tidyverse)
library(igraph)

# Load raw data csv file
bike_dat <- read_csv("data/Divvy_Trips_2018_Q4.csv")

# Create the basic bike sharing graph
# Group by from and to station ids

trip_df <- 
  bike_dat %>%
  group_by(from_station_id, to_station_id) %>%
  summarise(weights = n())

head(trip_df)

# Consider what we want to use for edge weights
# The number of trips between stations

trip_g <- graph_from_data_frame(trip_df[, 1:2])

# Add in the edge weights

E(trip_g)$weight <- trip_df$weights

# Quick exploration of the graph

gsize(trip_g)
gorder(trip_g)





