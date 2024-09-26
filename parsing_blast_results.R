
#set working directory
setwd("/Users/cecihodson/Desktop/Genome_Data/Petrolisthes_genomes/Genome_Annotation_Files")


#packages
library(readr)
library(tidyverse)
library(dplyr)
library(tidyr)
library(ggplot2)
library(igraph)

#pull up csv file
blast_results <- read.table('blastresults.csv', sep='\t')

colnames(blast_results) <- c("query_sequence_ID", "target_sequence_ID", "percent_identical", 
                             "alignment_length", "number_of_mismatches", "number_of_gap_openings", 
                             "query_start", "query_end", "target start", "target end", "e_value", 
                             "bit score")

#time to parse
likely_homologs <- blast_results %>% 
  filter(percent_identical > 90) %>% 
  filter(e_value < 0.0001)

unique_homologs <- likely_homologs %>% 
  distinct()

#everything with a percent_identical value greater than 70% and
#everything with an e-value less than 0.01 (according to https://www.metagenomics.wiki/tools/blast/evalue)


#plotting distribution of percent identity (greater than 90)
ggplot(likely_homologs, aes(x = percent_identical)) +
  geom_bar(fill = "steelblue", width = 0.1) +
  labs(title = "Distribution of Hits by Percent Identity: < 90%",
       x = "Percent Identity",
       y = "Count") +
  scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, by = 5)) + 
  theme_minimal()


#plotting distribution of percent identity (all blast results)
ggplot(blast_results, aes(x = percent_identical)) +
  geom_bar(fill = "steelblue", width = 1) +
  labs(title = "Distribution of Hits by Percent Identity: All Blast",
       x = "Percent Identity",
       y = "Count") +
  scale_y_continuous(limits = c(0, 1000), breaks = seq(0, 1000, by = 100)) + 
  theme_minimal()





