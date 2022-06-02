DistributionSummaryAsHTML <- function(distribution) {
  paste0(
    '<h3>Mean: ',
    round(distribution$mean, 4),
    '<br/>',
    'Variance: ',
    round(distribution$variance, 4),
    '<br/>',
    'Median: ',
    round(distribution$median, 4),
    '<br/>',
    'Mode: ',
    round(distribution$mode, 4),
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
