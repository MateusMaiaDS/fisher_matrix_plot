# Fisher's Exact Test Matrix Plot
An piece of code to plot a matrix of multiple pairwise test between multiple categorical variables using Fisher's Exact Test.

To use this piece of function is required to install the `{r} library(plot.matrix)`.

If the package is not installed then, run

```{r}
install.packages("plot.matrix")
```

# How to use it

The piece of code corresponds to the function `{r} plot.fisher.matrix`. The function need only two arguments: an `data.frame` with the categorical variables in factor format, and the p-value that will be used in Fisher's exact test. The function return a plot and a matrix with the p-values of each pairwise test.

