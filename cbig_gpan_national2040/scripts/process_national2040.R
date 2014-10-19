library(dplyr)
library(reshape2)
library(tidyr)

# NOTE: This script assumes that current working directory is set to the root
# of this data package.

# Input and output names --------------------------------------------------

in_file <- "../../gpan/data/cbig_gpan_national2040_curves_full.txt"
out_file <- "data/cbig_gpan_national2040.csv"
groups_file <- "../../gpan/data//groups_iucn_spp_ecor.txt"

# Read in the data --------------------------------------------------------

# Groups definition file (the same as used in the analysis)
grps <- as.numeric(read.table(groups_file)[,1])

# The feature-specific groups data file (Zonation output) 
dat <- dplyr::tbl_df(read.table(in_file, header=FALSE, as.is=TRUE))

# Standard Zonation header
z_header <- c("pr_lost", "cost", "min_pr", "ave_pr", "w_pr", "ext1", "ext2") 

# Create a dummy feature name and group mapping
features <- data.frame(feat_name=paste0("F", 1:(ncol(dat)-length(z_header))),
                       group=grps, stringsAsFactors=FALSE)

# Use standard Zonation header and dummy feature name
names(dat) <- c(z_header, features$feat_name)

# Let's get rid of most of the standard Zonation variables
feature_dat <- dplyr::select(dat, -cost, -min_pr, -ave_pr, -w_pr, -ext1, -ext2)

# Tidy the data
m_dat <- tidyr::gather(feature_dat,  feat_name, value, -pr_lost)

# Join the groups information based on the feature name
m_dat <- dplyr::left_join(m_dat, features, by=c("feat_name"))

# Filter the data ---------------------------------------------------------

# 99 is alway ecoregions, IUCN categories do not apply: DROP ECOREGIONS
m_dat <- dplyr::filter(m_dat, group != 99)

# Tease apart the species and IUCN categories -----------------------------

# Make all possible combinations
grp_combinations <- expand.grid(c(1, 2, 4, 7), 1:7)
grp_combinations <- sort(as.numeric(paste0(grp_combinations[,1], 
                                           grp_combinations[,2])))

spp_groups <- c("amphibians", "birds", "mammals", "reptiles")
iucn_groups <- c("LC", "NT", "VU", "EN", "CR", "DD", "EX")

groups <- data.frame(group=grp_combinations,
                     spp_group=rep(spp_groups, 1, each=length(iucn_groups)),
                     iucn_group=rep(iucn_groups, length(spp_groups)))

# Join species and IUCN category information to main data -----------------

m_dat <- dplyr::left_join(m_dat, groups, by=c("group"))

# Calculate average props -------------------------------------------------

# Using dplyr

mean_dat <- m_dat %>%
  group_by(pr_lost) %>%
  summarise(ave_pr=mean(value)) %>%
  mutate(pr_rem=1-pr_lost) %>%
  select(pr_lost, pr_rem, ave_pr)

spp_group_mean <- m_dat %>%
  group_by(pr_lost, spp_group) %>%
  summarise(ave_pr=mean(value)) %>%
  ungroup() %>%
  spread(spp_group, ave_pr)

# NOTE: DD, EN and EX are filtered out

iucn_group_mean <- m_dat %>%
  group_by(pr_lost, iucn_group) %>%
  summarise(ave_pr=mean(value)) %>%
  ungroup() %>%
  spread(iucn_group, ave_pr) %>%
  select(pr_lost, LC, NT, VU, EN, CR)

# Just the endangered species (VU, EN, CR)
endangered_group_mean <- m_dat %>%
  filter(iucn_group == "VU" | iucn_group == "EN" | iucn_group == "CR") %>%
  group_by(pr_lost) %>%
  summarise(endangered=mean(value)) %>%
  ungroup()

# Combine data
mean_dat <- left_join(mean_dat, spp_group_mean, by="pr_lost")
mean_dat <- left_join(mean_dat, iucn_group_mean, by="pr_lost")
mean_dat <- left_join(mean_dat, endangered_group_mean, by="pr_lost")

# Write data --------------------------------------------------------------

write.table(mean_dat, out_file, row.names=FALSE, sep=";")

# Plots -------------------------------------------------------------------

library(ggplot2)

spp_plot_dat <- tidyr::gather(spp_group_mean, group, values, 
                               amphibians:reptiles, -pr_lost)
iucn_plot_dat <- tidyr::gather(iucn_group_mean, group, values, 
                               LC:CR, -pr_lost)

ggplot(spp_plot_dat, aes(x=pr_lost, y=values, color=group)) + geom_line()
ggplot(iucn_plot_dat, aes(x=pr_lost, y=values, color=group)) + geom_line()
