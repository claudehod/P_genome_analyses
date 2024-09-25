
#set working directory
setwd("/Users/cecihodson/Desktop/Genome_Data/Petrolisthes_genomes/Genome_Annotation_Files")


#packages
library(readr)
library(tidyverse)
library(dplyr)
library(tidyr)

#pull up csv file
blast_results <- read.table('blastresults.csv', sep='\t')

colnames(blast_results) <- c("query_sequence_ID", "target_sequence_ID", "percent_identical", 
                             "alignment_length", "number_of_mismatches", "number_of_gap_openings", 
                             "query_start", "query_end", "target start", "target end", "e_value", 
                             "bit score")

#time to parse
likely_homologs <- blast_results %>% 
  filter(percent_identical > 70) %>% 
  filter(e_value < 0.01)


#everything with a percent_identical value greater than 70%
#everything with an e-value less than 0.01 (according to https://www.metagenomics.wiki/tools/blast/evalue)

#figure out how to keep only the best match maybe?





