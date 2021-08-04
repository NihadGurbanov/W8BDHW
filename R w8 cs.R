library(dplyr)
df <-  read.csv('bina_az.csv')

#1
newdata <- df[-1]  
newdata

#2
ndf <- newdata %>% select('ID', everything());

#3
ndf %>% select(contains('Adres')) %>% View();

#4

class(ndf$sahe)
class(ndf$otaq)
ndf$otaq <- as.numeric(ndf$otaq)
class(ndf$otaq)
ndf <- ndf %>% transmute(
  newcol = sahe / otaq);

#5

ndf %>% filter(nov =='KÃ¶hnÉ™ tikili') %>% select(qiymet) %>% max();

#6

ndf %>% select(Adres_1) %>% unique();

#7

ndf %>% filter(nov == 'Yeni tikili' & qiymet>500000) %>% count(otaq)


#8

ndf %>% filter(kupca =='var' & sahe>200) %>% summarise(mean(qiymet))

#9
ndf %>% filter(otaq == '4') %>% summarise(range(qiymet))

#10
ndf %>% filter(elani_yerlesdiren =='mÃ¼lkiyyÉ™tÃ§i' & nov =='Yeni tikili' & sahe>100 ) %>% count(elani_yerlesdiren)
