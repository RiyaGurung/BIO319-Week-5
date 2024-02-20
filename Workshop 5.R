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


