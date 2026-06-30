## Death by Hip Hop

source("../setup.R")
source("../themes.R")

# import data
dat <- read_csv("age_of_death_music_genre.csv") %>% 
  clean_names()

# make long, re-arrange genre
dat_long <- dat %>% 
  pivot_longer(
    cols = -genre,
    names_to = "group",
    values_to = "age_at_death"
  )

genre_sorted <- dat %>% arrange(desc(female_musicians)) %>% pull(genre)
dat_long$genre <- factor(dat_long$genre, levels = genre_sorted)
# dat_long$genre <- factor(dat_long$genre, levels = dat$genre)
dat_long$group <- recode_label(dat_long$group) %>% str_replace("Us", "US")

dat_long <- dat_long %>%
  mutate(
    lw = if_else(
      group %in% c("Female musicians", "Male musicians"),
      1.5,   # thick lines
      0.75    # thin lines
    )
  )


# line chart by variable

dat_long %>% 
  ggplot(aes(x = genre, y = age_at_death, group = group, color = group, linewidth = lw)) +
  geom_line() +
  scale_linewidth_identity(guide = "none") +
  scale_color_manual(values = c(
    "#c0392b",  # blood red
    "#f1c40f",  # streetlight yellow
    "#d98880",  # cold grey
    "#f9e79f"   # fog silver
  )) +
  geom_text(
    aes(x = "Folk", y = 48,
      label = "Female musicians",
      color = "Female musicians"),
    hjust = 1, vjust = 0, size = 3.2, show.legend = FALSE) +
  geom_text(
    aes(x = "Punk", y = 45,
        label = "Male musicians",
        color = "Male musicians"),
    hjust = 0, vjust = 0, size = 3.2, show.legend = FALSE) +
  geom_text(
    aes(x = "Pop", y = 72,
        label = "US female life expectancy\n(genre fans)",
        color = "US female life expectancy"),
    hjust = 0, vjust = 0, size = 3.2, show.legend = FALSE) +
  geom_text(
    aes(x = "Rock", y = 55,
        label = "US male life expectancy\n(genre fans)",
        color = "US male life expectancy"),
    hjust = 0, vjust = 0, size = 3.2, show.legend = FALSE) +
  labs(
    title = "Exhibit #1",
    subtitle = "Average age of death by music genre",
    x = NULL,
    y = NULL,
  ) + 
  theme_detective() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("death-by-beat-chart.pdf", width = 6, height = 4, device = cairo_pdf)


# DAG

dag_out <- grViz("
digraph DAG {
  graph [
    layout = dot,
    rankdir = LR,
    bgcolor = black,
    fontname = \"Special Elite\",
    labelloc = t,
    labeljust = c,
    label = <
      <TABLE BORDER=\"0\" CELLBORDER=\"0\" CELLSPACING=\"0\" ALIGN=\"CENTER\">
        <TR>
          <TD ALIGN=\"CENTER\">
            <FONT POINT-SIZE=\"18\" COLOR=\"white\"><B>Exhibit #2</B></FONT>
          </TD>
        </TR>
        <TR>
          <TD ALIGN=\"CENTER\">
            <FONT POINT-SIZE=\"12\" COLOR=\"#c0392b\">Map of suspects</FONT>
          </TD>
        </TR>
      </TABLE>
    >
  ]

  node [shape = plaintext, fontcolor = white, fontname = \"Special Elite\"]
  edge [color = white, penwidth = 1.6, arrowsize = 0.5]

  Genre -> Death
  Sex -> Death
  Genre -> \"Life-\\nstyle\" -> Death
}
")

dag_out %>%
  export_svg() %>%
  write_lines("death-by-beat-dag.svg")
rsvg_pdf("death-by-beat-dag.svg", "death-by-beat-dag.pdf")

