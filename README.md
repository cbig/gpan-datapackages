## 1. Curves data from Zonation

The group code is a combination of species code + IUCN redlist category code, as 
follows:

**Species code:**

```
Amphibians = 1 
Birds = 2
Mammals = 4 
Reptiles = 7 
Ecoregions = 9
```
  
**IUCN redlist category code:**

```
Least concern = 1
Near threatened = 2
Vulnerable = 3
Endangered = 4
Critically endangered = 5
Data deficient = 6
Extinct in the wild = 7
Extinct = 7
All ecoregions = 9
```

**NOTE** "Extinct in the wild" and "Extinct" cannot be separated (both coded 
with 7).

An example: the group for a least concern bird would be 21.

## 2. Data subsetting and cleaning

Done by R script `R/groups_and_real_overall_mean.R`

## 3. Data outputs

3 outputs are created:

### cbig_gpan_curves_3_groupings.csv

Includes all the feature data excluding ecoregions based on 3 grouping columns. 
Table columns are the following:

| Column     | Description                                                     |
|------------|-----------------------------------------------------------------|
| f_rem      | Fraction of landscape remaining (x-axis in plotting) [1, 100]   |
| spp_group  | Species grouping ["amphibians", "birds", "mammals", "reptiles"] |
| iucn_group | IUCN category ["LC", "NT", "VU", "EN", "CR", "DD", "EX"]        |
| variant    | Variant grouping ["global2000", "global"2040, "national2000", "national2040"] |
| value      | Fraction of distribution remaining (y-axis in plotting)         |

### cbig_gpan_curves_2_groupings.csv

Includes all the feature data excluding ecoregions based on 2 grouping columns. 
**DD and EX have been removed** from the IUCN category grouping, but are 
included in the species grouping. Data is more redundant, but enables easier
plotting based on just 2 grouping columns. Table columns are the following:

| Column     | Description                                                     |
|------------|-----------------------------------------------------------------|
| f_rem      | Fraction of landscape remaining (x-axis in plotting) [1, 100]   |
| group      | Grouping ["LC", "NT", "VU", "EN", "CR", "en+vu+cr", "amphibians", "birds", "mammals", "reptiles"] |
| variant    | Variant grouping ["global2000", "global"2040, "national2000", "national2040"] |
| value      | Fraction of distribution remaining (y-axis in plotting)         |

### cbig_gpan_mean_curves.csv

Includes means over all features. These are caclulated from the original 
feature-specific performance data.

| Column     | Description                                                     |
|------------|-----------------------------------------------------------------|
| f_rem      | Fraction of landscape remaining (x-axis in plotting) [1, 100]   |
| variant    | Variant grouping ["global2000", "global"2040, "national2000", "national2040"] |
| value      | Fraction of mean distribution remaining (y-axis in plotting)   |
