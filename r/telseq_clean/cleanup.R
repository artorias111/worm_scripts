library(tidyverse)

eleg_raw <- read_tsv("/Users/shrirambhat/Desktop/rmd_data/raw_lengths/eleg_raw.tsv")
trop_raw <- read_tsv("/Users/shrirambhat/Desktop/rmd_data/raw_lengths/trop_raw.tsv")
brig_raw <- read_tsv("/Users/shrirambhat/Desktop/rmd_data/raw_lengths/brig_raw.tsv")

eleg_si <- read_tsv("/Users/shrirambhat/Desktop/rmd_data/20210115_isotype_assignment.tsv")
trop_si <- read_tsv("/Users/shrirambhat/Desktop/rmd_data/20210901_c.tropicalis_isotype_assignment.tsv")
brig_si <- read_tsv("/Users/shrirambhat/Desktop/rmd_data/20210803_c.briggsae_isotype_assignment.tsv")

my_worm <- eleg_raw

#cleanup:
a <- my_worm %>% select(ReadGroup) %>% filter(grepl("\\[",ReadGroup))
b <- my_worm %>% select(LENGTH_ESTIMATE) %>% drop_na()
c <- as_tibble(cbind(a,b)) %>% mutate(ReadGroup=str_replace(ReadGroup,"\\[","")) %>% mutate(ReadGroup=str_replace(ReadGroup,".bam]",""))

my_worm_clean <- c

#eleg_length <- my_worm_clean
#trop_length <- my_worm_clean
#brig_length <- my_worm_clean

my_worm <- trop_length

e <- (46/3327208)*(58087/12)
b <- (46/3327208)*(53507/12)
t <- (46/3327208)*(74844/12) 

my_worm <- my_worm %>% mutate(LENGTH_ESTIMATE=LENGTH_ESTIMATE*t)
my_worm <- my_worm %>% rename(strain=ReadGroup,length=LENGTH_ESTIMATE)

#eleg_slength <- my_worm
#brig_slength <- my_worm
#trop_slength <- my_worm

#write_tsv(trop_slength,'trop_strain.tsv')

eleg_ilength <- eleg_slength %>% inner_join(eleg_si) %>% group_by(isotype) %>% summarise(new_length = mean(length)) %>% rename(length=new_length)
trop_ilength <- trop_slength %>% inner_join(trop_si) %>% group_by(isotype) %>% summarise(new_length = mean(length)) %>% rename(length=new_length)
brig_ilength <- brig_slength %>% inner_join(brig_si) %>% group_by(isotype) %>% summarise(new_length = mean(length)) %>% rename(length=new_length)

#write_tsv(brig_ilength,'brig_isotype.tsv')

eleg_mlength <- eleg_ilength %>%mutate(length=round(length,0))
trop_mlength <- trop_ilength %>%mutate(length=round(length,0))
brig_mlength <- brig_ilength %>%mutate(length=round(length,0))

write_tsv(brig_mlength,'brig_mean.tsv')