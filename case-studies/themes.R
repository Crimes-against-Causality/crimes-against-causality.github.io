theme_detective <- function(base_size = 12) {
  theme_minimal(base_size = base_size, base_family = "baskerville") %+replace%
    theme(
      # Backgrounds
      plot.background  = element_rect(fill = "#000000", color = NA),
      panel.background = element_rect(fill = "#000000", color = NA),
      
      # Grid
      panel.grid.major = element_line(color = "#6f6f6f", linewidth = 0.4),
      panel.grid.minor = element_blank(),
      
      # Axes (serif)
      axis.line  = element_line(color = "#6f6f6f", linewidth = 0.4),
      axis.text  = element_text(color = "#d0d0d0", family = "baskerville"),
      axis.title = element_text(color = "#e6e6e6", face = "bold", family = "baskerville"),
      
      # Title/subtitle (typewriter)
      plot.title = element_text(
        family = "special_elite",
        color = "white",
        face = "bold",
        size = base_size * 1.3,
        hjust = 0
      ),
      # Subtitle (blood red)
      plot.subtitle = element_text(
        family = "special_elite",
        color = "#c0392b",
        size = base_size,
        hjust = 0,
        margin = margin(b = 14)
      ),
      # Other text
      plot.caption = element_text(color = "#8c8c8c", family = "baskerville"),
      
      # Legend off
      legend.position = "none",
      
      # Facets
      strip.background = element_rect(fill = "#1e1e1e", color = NA),
      strip.text       = element_text(color = "#e6e6e6", face = "bold", family = "baskerville")
    )
}
