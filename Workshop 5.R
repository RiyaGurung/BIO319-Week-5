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




