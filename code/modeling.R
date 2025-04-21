# Estimate multinomial logit (MNL) models

# Load libraries
library(logitr)
library(tidyverse)
library(fastDummies)
library(janitor)
library(here)
options(dplyr.width = Inf) # So you can see all of the columns

# -----------------------------------------------------------------------------
# Load the data set:
data <- read_csv(here("data", "choiceData.csv"))
head(data)

# Estimate MNL model

# First create some dummy coded variables for categorical variables
data <- dummy_cols(data, c('type', 'freshness'))

# Clean up names of created variables
data <- clean_names(data)
    
# Estimate the model
model <- logitr(
    data    = data,
    outcome = "choice",
    obsID   = "obs_id",
    # Estimate multinomial logit (MNL) models

# Load libraries
library(logitr)
library(tidyverse)
library(fastDummies)
library(janitor)
library(here)
options(dplyr.width = Inf) # So you can see all of the columns

# -----------------------------------------------------------------------------
# Load the data set:
data <- read_csv(here("data", "choiceData.csv"))
head(data)

# Estimate MNL model

# First create some dummy coded variables for categorical variables
data <- dummy_cols(data, c('type', 'freshness'))

# Clean up names of created variables
data <- clean_names(data)
    
# Estimate the model
model <- logitr(
    data    = data,
    outcome = "choice",
    obsID   = "obs_id",
    pars = c(
        "Certification_Especial", "Certification_Organico", "Certification_Fair trade", "Certification_Rainforest Alliance"
        "Origin_Brasil Central", "Origin_Sul de Minas",
        "Processing_Natural", "Processing_Lavado")
)

# View summary of results
summary(model)

# Check the 1st order condition: Is the gradient at the solution zero?
model$gradient

# 2nd order condition: Is the hessian negative definite?
# (If all the eigenvalues are negative, the hessian is negative definite)
eigen(model$hessian)$values
)

# View summary of results
summary(model)

# Check the 1st order condition: Is the gradient at the solution zero?
model$gradient

# 2nd order condition: Is the hessian negative definite?
# (If all the eigenvalues are negative, the hessian is negative definite)
eigen(model$hessian)$values
