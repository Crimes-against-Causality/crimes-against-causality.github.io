library(tidyverse)
library(janitor)
library(showtext)
library(sysfonts)
library(ragg) 
library(DiagrammeR)
library(DiagrammeRsvg)
library(gt)
library(scales)
library(knitr)

font_add_google("Special Elite", "special_elite")
font_add_google("Libre Baskerville", "baskerville")
font_add_google("Homemade Apple", "homemade_apple")
font_add_google("Sue Ellen Francisco", "sue_ellen_francisco")
font_add_google("Pangolin", "pangolin")


showtext_auto()
update_geom_defaults("text", list(family = "baskerville"))

first_up <- function(x) {
  stringr::str_replace(x, "^.", stringr::str_to_upper)
}

recode_label <- function(x) {
  first_up(gsub("_", " ", x))
}



