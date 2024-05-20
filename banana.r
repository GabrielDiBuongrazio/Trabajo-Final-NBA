---
title: "hola"
output:
  pdf_document: default
  word_document: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
library(tidyverse)
library(gridExtra)
library(knitr)
library(dplyr)

df <- NBA_G1
df <- df %>%
  mutate(season_by_decade=case_when(
    SEASON %in% c("2016-17", "2017-18", "2018-19", "2019-20", "2020-21", "2021-22", "2022-23") ~ "decade 3",
    SEASON %in% c("2006-07", "2007-08", "2008-09", "2009-10", "2010-11", "2011-12", "2012-13", "2013-14", "2014-15", "2015-16") ~ "decade 2", 
    SEASON %in% c("2005-06","2004-05", "2003-04", "2002-03", "2001-02", "2000-01", "1999-00", "1998-99", "1997-98", "1996-97") ~ "decade 1",
    TRUE ~ "other"
  ))

```

