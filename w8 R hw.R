library(dplyr)
df <-  read.csv('turbo_az.csv')

#1
new_turbo_data <- df %>% rename(qiymeti = ï..Qiymet, barter = barter_mumkundurmu, valyuta= sign)

#2
df <- df %>% rename(qiymet = ï..Qiymet)
df %>% filter(Marka == 'Lexus') %>% summarise(max(qiymet));


#3

filter(df %>% summarise(max(qiymet)))
df %>% filter(qiymet==420000) %>% View()

#4
df %>% filter(Marka == 'BMW') %>% count(Reng)

#5

df %>% filter(Marka == 'Porsche' & Reng == 'Qara' & Yeni =='BÉ™li') %>% count()

#6

df %>% filter(Marka=='Mercedes' & sign=='AZN' & Oturucu =='Tam') %>% select(qiymet) %>% max()


#7

df %>% filter(Marka =='Mercedes' & Yeni =='BÉ™li' & Model =='E 220') %>% count()

#8

table(df$Reng %>% unique()) %>% as.data.frame() %>% count()

#9

df %>% filter(Marka=='Opel' & Reng =='Qara') %>%select(qiymet) %>%summarise(median(qiymet))

#10

df %>% filter(Marka == 'Nissan' & Ban_novu == 'Offroader / SUV') %>% count()
