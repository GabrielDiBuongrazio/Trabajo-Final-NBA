df <- NBA_G1 
df1 <- df %>%
  mutate(season_by_period=case_when(
    SEASON %in% c('2014-15', '2015-16', '2016-17', '2017-18', '2018-19', '2019-20', '2020-21', '2021-22', '2022-23') ~ "period 3",
    SEASON %in% c('2005-06', '2006-07', '2007-08', '2008-09', '2009-10', '2010-11', '2011-12', '2012-13', '2013-14') ~ "period 2", 
    SEASON %in% c('1996-97', '1997-98', '1998-99', '1999-00', '2000-01', '2001-02', '2002-03', '2003-04', '2004-05') ~ "period 1",
    TRUE ~ "other"
  )) 

season.by.period <- df1 %>% select(season_by_period)

team_by_period_w_prom <- df1 %>% group_by(TEAM) %>% summarise(w_prom = sum(W)/(sum(W)+sum(L)))

team_by_period_w_prom 


period.1 <- df1 %>% filter(season_by_period == "period 1")


df2 <- period.1 %>% group_by(TEAM) %>% summarise(m.win= mean(W))

df3 <- df2[order(df2$m.win, decreasing = TRUE),] 

str(season.by.period)


