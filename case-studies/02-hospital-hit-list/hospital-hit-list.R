## The Hospital Hit List
## Generates all exhibits for Case 02
##
## Exhibits produced:
##   exhibit-1-overall-survival.pdf / .png   — bar chart (ggplot2)
##   exhibit-2-hospital-profiles.html        — styled gt table
##   exhibit-2-hospital-profiles.md          — plain markdown table
##   exhibit-3-survival-by-condition.html    — styled gt table
##   exhibit-3-survival-by-condition.md      — plain markdown table

source("../setup.R")
source("../themes.R")




# ── 1. Data import & wrangling ────────────────────────────────────────────────

dat <- read_csv("hospital_data.csv") %>% clean_names()

# Compute totals row and survival rates
totals <- dat %>%
  summarise(
    condition         = "All patients",
    charon_patients   = sum(charon_patients),
    charon_survivors  = sum(charon_survivors),
    elysium_patients  = sum(elysium_patients),
    elysium_survivors = sum(elysium_survivors)
  )

dat_full <- bind_rows(dat, totals) %>%
  mutate(
    condition        = factor(condition,
                              levels = c("Bone fractures", "Cardiac events",
                                         "Gunshot wounds", "All patients")),
    charon_survival  = charon_survivors  / charon_patients,
    elysium_survival = elysium_survivors / elysium_patients
  ) %>%
  arrange(condition)


# ── 2. Exhibit 1 — Overall survival bar chart ─────────────────────────────────

overall <- dat_full %>%
  filter(condition == "All patients") %>%
  select(charon_survival, elysium_survival) %>%
  pivot_longer(
    everything(),
    names_to  = "hospital",
    values_to = "survival"
  ) %>%
  mutate(
    hospital = case_when(
      hospital == "charon_survival"  ~ "Charon Memorial\nHospital",
      hospital == "elysium_survival" ~ "Elysium\nMedical Centre"
    ),
    # Charon first (taller bar, the "safe" one); Elysium last (the accused, blood red)
    hospital = factor(hospital, levels = c("Charon Memorial\nHospital",
                                           "Elysium\nMedical Centre"))
  )

overall %>%
  ggplot(aes(x = hospital, y = survival, fill = hospital)) +
  geom_col(width = 0.5) +
  geom_text(
    aes(label = percent(survival, accuracy = 0.1)),
    vjust    = -0.7,
    color    = "white",
    family   = "baskerville",
    size     = 5,
    fontface = "bold"
  ) +
  scale_fill_manual(values = c(
    "Elysium\nMedical Centre"   = "#c0392b",   # blood red — the accused
    "Charon Memorial\nHospital" = "#7f8c8d"    # cold grey — the apparent safe haven
  )) +
  scale_y_continuous(
    labels = percent_format(accuracy = 1),
    limits = c(0, 1),
    expand = expansion(mult = c(0, 0.14))
  ) +
  labs(
    title    = "Exhibit #1",
    subtitle = "Overall patient survival rates",
    x        = NULL,
    y        = NULL,
    caption  = "Source: City Health Authority Annual Report"
  ) +
  theme_detective()

ggsave("exhibit-1-overall-survival.pdf", width = 6, height = 5, dpi = 300, device = cairo_pdf)


# ── 3. Exhibit 2 — Hospital profiles table ───────────────────────────────────
#    Static data — no CSV needed for this one.

hospital_profiles <- tibble(
  attribute = c(
    "Founded",
    "Licensed beds",
    "Annual budget",
    "Designation",
    "Patient satisfaction rating"
  ),
  charon = c(
    "1887",
    "620",
    "$220 million",
    "Community hospital",
    "4.1 / 5"
  ),
  elysium = c(
    "1962",
    "285",
    "$210 million",
    "Regional trauma centre; specialist referral hub",
    "4.7 / 5"
  )
)

# ── 3a. Styled gt table (HTML) ──────────────────────────────────────────────

hospital_profiles %>%
  gt() %>%
  # Column labels
  cols_label(
    attribute = "",
    charon    = md("**Charon Memorial Hospital**"),
    elysium   = md("**Elysium Medical Centre**")
  ) %>%
  # Header
  tab_header(
    title    = "Exhibit #2",
    subtitle = "The suspects — hospital profiles"
  ) %>%
  # Base font
  opt_table_font(font = google_font("Libre Baskerville")) %>%
  # Dark theme via tab_options
  tab_options(
    table.background.color             = "#0d0d0d",
    table.font.color                   = "#e0e0e0",
    table.border.top.color             = "#333333",
    table.border.top.width             = px(2),
    table.border.bottom.color          = "#333333",
    heading.background.color           = "#0d0d0d",
    heading.border.bottom.color        = "#333333",
    heading.title.font.size            = px(20),
    heading.subtitle.font.size         = px(14),
    heading.padding                    = px(12),
    column_labels.background.color     = "#141414",
    column_labels.font.weight          = "bold",
    column_labels.font.size            = px(13),
    column_labels.border.bottom.color  = "#c0392b",
    column_labels.border.bottom.width  = px(2),
    data_row.padding                   = px(10),
    row.striping.background_color      = "#111111",
    row.striping.include_stub          = TRUE
  ) %>%
  opt_row_striping() %>%
  # Title: white + Special Elite
  tab_style(
    style     = cell_text(
      font   = google_font("Special Elite"),
      color  = "white",
      weight = "bold",
      size   = px(20)
    ),
    locations = cells_title(groups = "title")
  ) %>%
  # Subtitle: blood red + Special Elite
  tab_style(
    style     = cell_text(
      font  = google_font("Special Elite"),
      color = "#c0392b",
      size  = px(14)
    ),
    locations = cells_title(groups = "subtitle")
  ) %>%
  # Attribute column: muted italic
  tab_style(
    style     = cell_text(color = "#aaaaaa", style = "italic"),
    locations = cells_body(columns = attribute)
  ) %>%
  # Elysium column header: blood red (the accused)
  tab_style(
    style     = cell_text(color = "#c0392b"),
    locations = cells_column_labels(columns = elysium)
  ) %>%
  # Charon column header: cool grey (the apparent safe haven)
  tab_style(
    style     = cell_text(color = "#95a5a6"),
    locations = cells_column_labels(columns = charon)
  ) %>%
  # Highlight the satisfaction rating row — counterintuitive, so draw the eye
  tab_style(
    style     = cell_text(color = "white", weight = "bold"),
    locations = cells_body(
      columns = everything(),
      rows    = attribute == "Patient satisfaction rating"
    )
  ) %>%
  # Column widths
  cols_width(
    attribute ~ px(220),
    charon    ~ px(260),
    elysium   ~ px(260)
  ) %>%
  gtsave("exhibit-2-hospital-profiles.html")


# ── 3b. Plain markdown table ────────────────────────────────────────────────

hospital_profiles %>%
  rename(
    ` `                          = attribute,
    `Charon Memorial Hospital`   = charon,
    `Elysium Medical Centre`     = elysium
  ) %>%
  kable(format = "markdown") %>%
  writeLines("exhibit-2-hospital-profiles.md")


# ── 4. Exhibit 3 — Survival by condition and hospital ────────────────────────

exhibit3_dat <- dat_full %>%
  mutate(
    charon_survival_pct  = percent(charon_survival,  accuracy = 0.1),
    elysium_survival_pct = percent(elysium_survival, accuracy = 0.1)
  ) %>%
  select(
    condition,
    charon_patients,  charon_survivors,  charon_survival_pct,
    elysium_patients, elysium_survivors, elysium_survival_pct
  )

# ── 4a. Styled gt table (HTML) ──────────────────────────────────────────────

exhibit3_dat %>%
  gt() %>%
  # Spanners
  tab_spanner(
    label   = md("**Charon Memorial Hospital**"),
    id      = "spanner_charon",
    columns = starts_with("charon")
  ) %>%
  tab_spanner(
    label   = md("**Elysium Medical Centre**"),
    id      = "spanner_elysium",
    columns = starts_with("elysium")
  ) %>%
  # Column labels
  cols_label(
    condition            = "Condition",
    charon_patients      = "Patients",
    charon_survivors     = "Survivors",
    charon_survival_pct  = "Survival",
    elysium_patients     = "Patients",
    elysium_survivors    = "Survivors",
    elysium_survival_pct = "Survival"
  ) %>%
  # Header
  tab_header(
    title    = "Exhibit #3",
    subtitle = "Survival rates by condition and hospital"
  ) %>%
  # Base font
  opt_table_font(font = google_font("Libre Baskerville")) %>%
  # Dark theme
  tab_options(
    table.background.color             = "#0d0d0d",
    table.font.color                   = "#e0e0e0",
    table.border.top.color             = "#333333",
    table.border.top.width             = px(2),
    table.border.bottom.color          = "#333333",
    heading.background.color           = "#0d0d0d",
    heading.border.bottom.color        = "#333333",
    heading.title.font.size            = px(20),
    heading.subtitle.font.size         = px(14),
    heading.padding                    = px(12),
    column_labels.background.color     = "#141414",
    column_labels.font.weight          = "bold",
    column_labels.font.size            = px(12),
    column_labels.border.top.color     = "#333333",
    column_labels.border.bottom.color  = "#444444",
    column_labels.border.bottom.width  = px(1),
    data_row.padding                   = px(10),
    row.striping.background_color      = "#111111",
    row.striping.include_stub          = TRUE
  ) %>%
  opt_row_striping() %>%
  # Title: white + Special Elite
  tab_style(
    style     = cell_text(
      font   = google_font("Special Elite"),
      color  = "white",
      weight = "bold",
      size   = px(20)
    ),
    locations = cells_title(groups = "title")
  ) %>%
  # Subtitle: blood red + Special Elite
  tab_style(
    style     = cell_text(
      font  = google_font("Special Elite"),
      color = "#c0392b",
      size  = px(14)
    ),
    locations = cells_title(groups = "subtitle")
  ) %>%
  # Spanner: Elysium — blood red (the accused)
  tab_style(
    style = list(
      cell_fill(color = "#1a0000"),
      cell_text(color = "#c0392b", weight = "bold")
    ),
    locations = cells_column_spanners(spanners = "spanner_elysium")
  ) %>%
  # Spanner: Charon — cool grey (the apparent safe haven)
  tab_style(
    style = list(
      cell_fill(color = "#111111"),
      cell_text(color = "#95a5a6", weight = "bold")
    ),
    locations = cells_column_spanners(spanners = "spanner_charon")
  ) %>%
  # "All patients" row: bold + red top border
  tab_style(
    style = list(
      cell_text(weight = "bold", color = "white"),
      cell_borders(sides = "top", color = "#c0392b", weight = px(2))
    ),
    locations = cells_body(rows = condition == "All patients")
  ) %>%
  # Elysium WINS each individual condition → green survival cell
  tab_style(
    style     = cell_text(color = "#2ecc71", weight = "bold"),
    locations = cells_body(
      columns = elysium_survival_pct,
      rows    = condition != "All patients"
    )
  ) %>%
  # Charon WINS overall → green survival cell
  tab_style(
    style     = cell_text(color = "#2ecc71", weight = "bold"),
    locations = cells_body(
      columns = charon_survival_pct,
      rows    = condition == "All patients"
    )
  ) %>%
  # Right-align numeric columns
  cols_align(align = "right",  columns = where(is.character) & !matches("condition")) %>%
  cols_align(align = "center", columns = condition) %>%
  # Column widths
  cols_width(
    condition            ~ px(140),
    charon_patients      ~ px(80),
    charon_survivors     ~ px(90),
    charon_survival_pct  ~ px(90),
    elysium_patients     ~ px(80),
    elysium_survivors    ~ px(90),
    elysium_survival_pct ~ px(90)
  ) %>%
  gtsave("exhibit-3-survival-by-condition.html")


# ── 4b. Plain markdown table ────────────────────────────────────────────────

dat_full %>%
  mutate(
    charon_survival_pct  = percent(charon_survival,  accuracy = 0.1),
    elysium_survival_pct = percent(elysium_survival, accuracy = 0.1)
  ) %>%
  select(
    Condition                          = condition,
    `Charon — patients`                = charon_patients,
    `Charon — survivors`               = charon_survivors,
    `Charon — survival`                = charon_survival_pct,
    `Elysium — patients`               = elysium_patients,
    `Elysium — survivors`              = elysium_survivors,
    `Elysium — survival`               = elysium_survival_pct
  ) %>%
  kable(format = "markdown") %>%
  writeLines("exhibit-3-survival-by-condition.md")
