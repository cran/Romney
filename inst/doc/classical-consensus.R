## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(Romney)

## ----formal-example-----------------------------------------------------------
sim <- simulate_consensus_data(24, 60, n_answers = 4,
                               competence = 0.6, seed = 7)
formal <- consensus(sim$responses, method = "formal", answer_levels = 1:4)
formal
head(formal$answer_key$key)

## ----binary-example-----------------------------------------------------------
path <- system.file("extdata", "synthetic_yesno_36x103.csv", package = "Romney")
binary_data <- as.matrix(read.csv(path, row.names = 1))
binary <- consensus(binary_data, method = "covariance", prior = 0.5)
binary
head(binary$answer_key$key)

## ----informal-example---------------------------------------------------------
path <- system.file("extdata", "synthetic_ordinal_36x103_1to5.csv", package = "Romney")
ordinal_data <- as.matrix(read.csv(path, row.names = 1))
informal <- consensus(ordinal_data, method = "informal")
informal
head(informal$answer_key$key)

## ----diagnostics--------------------------------------------------------------
formal$criteria
formal$diagnostics$extracted_factors
formal$diagnostics$positive_semidefinite
range(formal$diagnostics$pairwise_items)

## ----validation-location------------------------------------------------------
system.file("validation", "ucinet-summary.csv", package = "Romney")

