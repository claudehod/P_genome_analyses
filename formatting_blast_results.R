#Script for formatting BLAST output (format 6) for easier analysis


#set working directory
setwd("/Users/cecihodson/Desktop/Genome_Data/Petrolisthes_genomes/Genome_Annotation_Files")


#packages
install.packages("readr")
install.packages("tidyverse")
install.packages("dplyr")
install.packages("tidyr")
library(readr)
library(tidyverse)
library(dplyr)
library(tidyr)


#read csv and separate columns by '\t'
blast_results <- read.table('blastresults.csv', sep='\t')

colnames(blast_results) <- c("query sequence ID", "target sequence ID", "percent identical", 
                             "alignment length", "number of mismatches", "number of gap openings", 
                             "query start", "query end", "target start", "target end", "e-value", 
                             "bit score")

View(blast_results)


