DistributionSummaryAsHTML <- function(distribution) {
  paste0(
    '<h3>Mean: ',
    round(distribution$mean, 4),
    '<br/>',
    'Variance: ',
    round(distribution$variance, 4),
    '<br/>',
    'Median: ',
    ifelse(
      class(distribution$median) == 'numeric',
      round(distribution$median, 4),
      distribution$median
    ),
    '<br/>',
    'Mode: ',
    ifelse(
      class(distribution$mode) == 'numeric',
      round(distribution$mode, 4),
      distribution$mode
    ),
    '<br/>',
    'Skewness: ',
    round(distribution$skewness, 4),
    '<br/>',
    'Excess kurtosis: ',
    round(distribution$excess_kurtosis, 4),
    '<br/></h3>'
  ) %>%
    return()
}
