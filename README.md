
<!-- README.md is generated from README.Rmd. Please edit that file -->

# viraldomain

<!-- badges: start -->
<!-- badges: end -->

The goal of viraldomain is to provide methods for assessing the
applicability domain of models that predict viral load and CD4 (Cluster
of Differentiation 4) lymphocyte counts. These methods help determine
the extent of extrapolation when making predictions.

## Installation

You can install the development version of viraldomain from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("juanv66x/viraldomain")
```

## Data

### Predictive Modeling Data for Viral Load and CD4 Lymphocyte Counts

This data set serves as input for predictive modeling tasks related to
HIV research. It contains numeric measurements of CD4 lymphocyte counts
(cd) and viral load (vl) at three different time points: 2019, 2021, and
2022. These measurements are crucial indicators of HIV disease
progression.

``` r
data(viral)
print(head(viral))
#>    cd_2019     vl_2019  cd_2021    vl_2021  cd_2022      vl_2022
#> 1 824.5332    38.56798 991.7403   82.54730 699.5054     4.076213
#> 2 168.7046 11389.97420 274.4726 1671.39342 126.1513    14.921826
#> 3 342.5670 38960.42871 330.9015 5120.02580 127.0883 53268.898678
#> 4 423.1296    41.16719 454.1496   70.85965 546.0022    -7.202574
#> 5 441.1572    74.67582 478.8419  281.52784 547.4582    44.738029
#> 6 506.6313  4095.79251 553.0661 3077.96262 547.5480  1895.702386
```

### Seropositive Data for Applicability Domain Testing

This data set is designed for testing the applicability domain of
methods related to HIV research. It provides a tibble with 53 rows and 2
columns containing numeric measurements of CD4 lymphocyte counts
(cd_2022) and viral load (vl_2022) for seropositive individuals in 2022.

``` r
data(sero)
print(head(sero))
#>    cd_2022     vl_2022
#> 1 548.9531   19.975988
#> 2 160.1478   92.854885
#> 3 694.0009  -15.890951
#> 4 515.9214  -15.630209
#> 5 152.9998   -1.104756
#> 6 382.8012 3105.038849
```
