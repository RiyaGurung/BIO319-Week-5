#2
beetles1 <- read.csv('dung_beetles_v1.csv')
beetles1

beetles2 <- read.csv("dung_beetles_v2.csv")
beetles2

beetles3 <- read.csv("dung_beetles_v3.csv")
beetles3

beetles4 <- read.csv("dung_beetles_v4.csv")
beetles4
#dataset 4 is follows the 3 basic rules of tidy data: each row is an observation, each column is a variable and each value has its own cell

sites <- unique(beetles1$Site) 
length(sites) #we select the sites column with unique and get the length of the data 

colnames(beetles1)[3:ncol(beetles1)]
# we get the species names but in a more complicated way because the species names are in different columns 

species <- unique(beetles3$spp)
length(species) #getting the number of species in beetles3 and the answer is 3 

length(beetles3$spp) #thought this would be an easier way to do it but it takes in repeats of species and gives you the number of rows instead 

unique <- unique(beetles4$spp)
length(unique)
#by replacing $ with each column name, we can see how beetles4 is the table that lets you count all the unique values of each column

#3
str(beetles4) #gives you the number of observations and variables 
summary(beetles4) #gives you the interquartile ranges, the type of data/mode and the length 
head(beetles4) #gives you the first 6 rows of data by default and you can use tail for the opposite
head(beetles4, n = 1) #you can specify how many rows you want like this 
View(beetles4) #just takes you to the table tab 

#4
beetlesdf <- read.table('dung_beetles_read_1.csv', sep = ',',header = T)

beetles2df <- read.table('dung_beetles_read_2.txt',sep = '\t',header = T)
#not sure why we use '\t' but maybe due to the fact that it is a txt file instead of csv
beetles3df <- read.table('dung_beetles_read_3.txt',sep = '\t',header = T, skip = 1)
#we used skip here as there was an extra row on the first line that we did not want to read in 

#FILL
install.packages('tidyr')
library(tidyr)
?fill
beetlesdf <- fill(beetlesdf,Site) #you don't need the direction in this dataset

beetlesdf4 <- read.table('dung_beetles_read_4.txt', sep = '\t', header = T, na.strings = '-')
#sites was previously filled with '-' instead of N/A because R thinks that it is part of the data and we use na.strings to tell R that '-' means there is no data there 
beetlesdf4 <- fill(beetlesdf4,Site)

#5 - Piping
beetlesdf <- read.table("dung_beetles_read_1.csv", sep=",",header=T) %>% fill(Site)
#'%>%' takes the output of one function and puts it straight into the next one 

#6 - Pivoting
?pivot_longer
#pivot_longer lenghthens the data by adding more rows and reducing columns 

pivot_longer(data=beetlesdf, cols = c("Caccobius_bawangensis", "Catharsius_dayacus", "Catharsius_renaudpauliani", "Copis_agnus", "Copis_ramosiceps", "Copis_sinicus", "Microcopis_doriae", "Microcopis_hidakai"),names_to="Spp")
# instead of the species sitting in one row, they are now within the same column and multiple rows 
beetlesdf <- pivot_longer(data=beetlesdf, cols = starts_with('C'))
beetlesdf <- pivot_longer(data=beetlesdf, cols = contains('_'), names_to = 'Spp') 
#this is a simpler and less messy code
# we have used a selection helper
index <- beetlesdf[1,2]
index
#selecting columns using their numerical index 
?pivot_longer
# struggling with changing value to count

casesdf <- read.table('WMR2022_reported_cases_1.txt', sep = '\t', header = T, na.strings = '') %>% fill(country)

casesdf <- pivot_wider(casesdf, names_from = 'method', values_from = 'n')
# this makes the 'method' variables into columns and puts the values of 'n' into these columns 

#7
bigdf <- read.table("WMR2022_reported_cases_2.txt",sep="\t", header = T, na.strings='') %>% fill(country)
#corrected the code for reading in and filled in the countries 

bigdf <- pivot_longer(bigdf, cols= starts_with('X'), names_to = 'years')

bigdf <- pivot_wider(bigdf, names_from = 'method', values_from = 'value')
#these were done separately 

#can you use the pipe function to achieve the same output?
bigdf <- pivot_wider(data = bigdf, cols = starts_with('X'), names_to = 'years') %>% pivot_wider(data = bigdf, names_from = 'method', values_from = starts_with('X'), id_cols = )
  

