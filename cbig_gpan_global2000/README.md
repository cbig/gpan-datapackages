## DATA SET

Name: cbig_gpan_global2000
Version: 1.0.0
Date: 2014-12-16
Metadata authors: 
+ Tuuli Toivonen <tuuli.toivonen@helsinki.fi>
+ Joona Lehtomäki <joona.lehtomaki@helsinki.fi>

******************************

## CITATION

The data set is an output of spatial conservation prioritization carried out for global protected area expansion analyses published in Nature on 18th December 2014 with the title "Global protected area expansion is compromised by projected land-use and parochialism":

http://dx.doi.org/10.1038/nature14032

You can cite to our data by citing the original paper:

Pouzols, Federico Montesino
  - Toivonen, Tuuli
  - Di Minin, Enrico
  - Kukkala, Aija
  - Kullberg, Peter
  - Kuustera, Johanna
  - Lehtomaki, Joona
  - Tenkanen, Henrikki
  - Verburg, Peter H.
  - Moilanen, Atte
 (2014) Global protected area expansion is compromised by projected land-use and parochialism
. Nature XXX, XXX. 

******************************

## LICENCE

The data is licensed with Creative Commons Attribution 4.0 International (CC BY 4.0) lisence, see https://creativecommons.org/licenses/by/4.0/

******************************

## DESCRIPTION OF THE ANALYSES

The analysis identifies the priorities for expanding the current protected area network to 17 % of the terrestrial land - and beyond. It compares the spatial patterns and the performance of the prioritizations carried out globally and nationally (using database of Global Administrative Areas [1]), limiting the species ranges with present and future (2040) land use [2].

The analyses are based on the distributions of 24,757 terrestrial vertebrate species and 826 ecoregions provided by IUCN Red List [3] and WWF Terrestrial ecoregions [4]. The current protected area network was extracted from World Database on Protected Areas [5] by selecting those polygons that belonged to IUCN categories I to VI and had the status "designated". The analysis was carried out using Zonation software [6] developed in the Conservation Biology Informatics Group [7]. For full methodology and references, see the supplementary material of the article [8].

The analyses were performed at several different resolutions: 20 km, 10 km, 5 km and 1.7 km at the equator.  Due to limitations in the original data, we distribute all information in 20 km resolution. Contact the authors for the result data in higher resolution. A summary of the main results and conclusions accompanied by interactive graphs and maps are available at http://avaa.tdata.fi/web/cbig/gpan.

We share the results of four different prioritizations that together form the core results of our analyses: 

1. Global priorities with present land use (cbig_gpan_global2000)
2. Global priorities with future (2040) land use (cbig_gpan_global2040)
3. National with present land use (cbig_gpan_national2000)
4. National with future (2040) land use (cbig_gpan_national2040)

## DATA DESCRIPTION

This data set contains two files.
 
### 1. Performance curves data

`cbig_gpan_global2000_curves.csv`, contains the performance curves data of the analysis.
The CSV file has the following columns:

    1. proportion of landscape lost
    2. proportion of landscape remaining
    3. average proportion remaining
    4. amphibians average proportion remaining
    5. birds average proportion remaining
    6. mammals average proportion remaining
    7. reptiles average proportion remaining
    8. LC average proportion remaining
    9. NT average proportion remaining
    10. VU average proportion remaining
    11. EN average proportion remaining
    12. CR average proportion remaining
    13. Endangered (VU, EN, CR) average proportion remaining

### 2. Rank priority map data

`cbig_gpan_global2000.tif`, presenting the resulting priority raster map in GeoTIFF format.

The pixel values range between 0 and 1 representing the priority of the pixel in the priority ranking produced by Zonation, higher values indicating higher priority. Values equal and above 0.83 represent the best 17 % of the terrestrial land for protection, including the current protected areas. For uncertainty of these values, see the sections 3.4 and 3.7 in the Supplementary material of the article [8].

Technical details of the raster data:

    Resolution: 0.2 degrees, equalling approximately 20 km at the Equator
    Columns & rows: 1800, 900
    Number of bands: 1
    Pixel type: floating point, 32 bit
    Range: 0 to 1
    Nodata value: -1
    Coordinate Refence System: WGS84 (EPSG:4326)

******************************

## REFERENCES

[1] http://www.gadm.org/
[2] http://10.1111/j.1365-2486.2012.02759.x
[3] http://www.iucnredlist.org 
[4] http://www.worldwildlife.org/publications/terrestrial-ecoregions-of-the-world
[5] http://www.protectedplanet.net
[6] http://cbig.it.helsinki.fi/software/zonation/
[7] http://cbig.it.helsinki.fi/
[8] http://www.nature.com/nature/journal/vnfv/ncurrent/full/nature14032.html#supplementary-information
