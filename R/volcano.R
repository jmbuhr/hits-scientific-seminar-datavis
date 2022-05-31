#!/bin/env Rscript
library(tidyverse)
library(rayshader)

data(volcano)
colnames(volcano) <- 1:ncol(volcano)
volcano <- volcano |> 
  as_tibble() |> 
  mutate(y = 1:n()) |> 
  pivot_longer(-y, names_to = "x", names_transform = parse_number)

plt <- volcano |>
  ggplot(aes(x = y, y = x, z = value, fill = value)) +
  geom_tile() +
  geom_contour(color = "black") +
  scale_x_continuous("X", expand = c(0, 0)) +
  scale_y_continuous("Y", expand = c(0, 0)) +
  scale_fill_gradientn("Z", colours = terrain.colors(10)) +
  coord_fixed() +
  guides(fill = "none")

png("img/volcano.png")
plot_gg(plt, multicore = TRUE, raytrace = TRUE,
        width = 7, height = 4,
        scale = 300, windowsize = c(1400, 866),
        zoom = 0.7, phi = 30, theta = 30)
Sys.sleep(0.2)
render_snapshot(clear = TRUE)
dev.off()

