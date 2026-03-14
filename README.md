# Increasing wild animal consumption across Central Africa
## Abstract

While human activities are driving widespread declines in wildlife populations, in Central Africa the meat of wild animals, or “wild meat”, represents a major component of the diets of millions of people. To halt faunal degradation while ensuring sustainable use of wildlife, it is crucial to understand the scale and drivers of wild meat consumption. Using data from over 12,000 households from 252 locations in Central Africa, we show that wild meat is a fundamental component of the diets of rural populations, accounting for 20% of the recommended daily protein intake, compared to 13% and 6% for those living in towns and cities. We estimate that the total annual biomass of wild meat consumed in Central Africa increased from 0.73 to 1.10 million tonnes between 2000 and 2022, with increasing demand from towns and cities. To ensure that wild meat is available to rural communities, in accordance with the Sustainable Development Goals and the Kunming-Montreal Global Biodiversity Framework, reducing wild meat consumption in urban metropolises is key. While our results are based on the most comprehensive dataset available, the geographical coverage is incomplete and the dataset represents a minimal fraction of the entire population of Central Africa. Targeted studies are needed to validate our model and assess critical areas of intervention.

## 1.	Content
This repository includes files needed to replicate the simulations, statistical models and figures described in the manuscript.

The repository includes 42 files organised in 2 folders (pipelines) and 6 subfolders (Table 1).

*Table 1. Folder structure and description of files needed to reproduce the results presented in the manuscript*

Folder name| Subfolder name | File name | Description |
| ----------- | ----------- | --------- | ----------- |
|Models|~            |Run_models.R|R code to run all models |
|Models|~            |Create_figs_Extract_map_values.R|R code to draw figures and extract prediction values used to draw maps |
|Models|Data|Data_availability.md|Data availbility statement and instructions to obtain original data|
|Models|Data|demo_dataset.csv|Demo dataset|
|Models|Data|demo_distance_matrix.csv|Full distance matrix|
|Models|Data|predictions.csv|Prediction data|
|Models|Data|predictions_2LT.csv|Prediction data considering 2 location types|
|Models|Data|forest_cells.csv|Coordinates of prediction cells; includes column identifying cells within the Central Africa forest region|
|Models|Data|spatial_uncertainty_values.csv|Spatail uncertainty values used to draw Extended Data Fig.4|
|Models|R_code|list_data_m1.R|R code listing data to run model used for final predictions|
|Models|R_code|list_data_m2.R|R code listing data to run model investigating ED*LT interaction|
|Models|R_code|list_data_m3.R|R code listing data to run model with 2 location types (rural vs. urban)|
|Models|R_code|list_data_m1s.R|R code listing demo data to run model used for final predictions|
|Models|R_code|list_data_m2s.R|R code listing demo data to run model investigating ED*LT interaction|
|Models|R_code|list_data_m3s.R|R code listing demo data to run model with 2 location types (rural vs. urban)|
|Models|R_code|Fig_2|Code to draw Fig. 2 (main text)|
|Models|R_code|Fig_2|Code to draw Fig. 3a (main text)|
|Models|R_code|Fig_2|Code to draw Extended Data Fig. 5a|
|Models|R_code|extract_values.R|Function extracting predicted values from model result files|
|Models|R_code|extract_uncertainty.R|Function extracting uncertainty of predicted values from model result files|
|Models|Stan_models|Consumption_model.stan|Bayesian model used for final predictions|
|Models|Stan_models|Consumption_model_EDint.stan|Bayesian model with ED*LT interaction|
|Models|Stan_models|Consumption_model_2LT.stan|Bayesian model with 2 location types (rural vs. urban)|
|Models|Stan_models|check_Bernoulli.stan|Bayesian model assessing consumption probability|
|Models|Stan_models|check_Bernoulli_GP.stan|Bayesian model assessing consumption probability with spatial autocorrelation component|
|Models|Stan_models|check_Beta_hh.stan|Bayesian model assessing frequency of consumption |
|Models|Stan_models|check_Beta_hh_GP.stan|Bayesian assessing frequency of consumption with spatial autocorrelation component|
|Models|Stan_models|check_Gamma.stan|Bayesian model assessing quantity consumed|
|Models|Results|predictions_M_final.csv|Final predictions values used to draw maps|
|Models|Results|predictions_M_final.csv|Final uncertainty values used to draw maps|
|Models|Results|predictions_M_final.csv|Predictions values from model with 2 location types|
|Models|Results|predictions_M_final.csv|Uncertainty values from model with 2 location types|
|Simulation|~            |Run_simulation.R|R code to run simulation |
|Simulation|R_code|sim_consumption.R|R code simulating data based on parameters specified in "Run_simulation.R" |
|Simulation|R_code|make_vector_fun.R|Custom function to vectorize matrices|
|Simulation|R_code|run_simulation_coverage_1.T|R code generating 100 databases with sampling coverage = 5%|
|Simulation|R_code|run_simulation_coverage_2.T|R code generating 100 databases with sampling coverage = 10%|
|Simulation|R_code|run_simulation_coverage_3.T|R code generating 100 databases with sampling coverage = 15%|
|Simulation|R_code|save_objects_coverage_1.T|R code generating 100 databases with sampling coverage = 5%|
|Simulation|R_code|save_objects_coverage_2.T|R code generating 100 databases with sampling coverage = 10%|
|Simulation|R_code|save_objects_coverage_3.T|R code generating 100 databases with sampling coverage = 15%|
|Simulation|Stan_model|simulation_model.stan|Simplified Bayesian model used in the simulation

## 2.	Data availbility
Wild meat consumption data were extracted from different published and unpublished sources as described in Extended Data Table 1. Due to the sensitive nature of the data (including illegal activities, such as the consumption of protected wildlife species), unprocessed datasets are available with restrictions through the WILDMEAT Data Portal (https://explorer.wildmeat.org/). Each dataset is available under different data sharing conditions through a Data User Agreement, which gives data users control over the distribution and use of their data. The full processed dataset used for analysis will be shared upon request with researchers seeking to replicate the study results. Other requests must clearly specify the study objectives, and access will be granted on a case-by-case basis following permission from the original data providers. In all cases, data recipients will be required to abide by the data-sharing agreements of WILDMEAT. All requests should be addressed to: mattia.bessone@gmail.com
The data needed to reproduce the figures and maps shown in the main text are available at https://doi.org/10.5281/zenodo.19021125
## 3.	System requirements 
The code runs in R (ver. 4.3.1) and requires the R packages datawizard (ver. 1.0.2), rstan (ver. 2.32.7), rethinking (ver. 4.21), loo (ver. 2.5.1) and LaplacesDemon (ver. 16.1.6). A detailed description of the steps needed to install rstan can be found here : https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started. Installation steps for the rethinking pacakge are found here: https://github.com/rmcelreath/rethinking  
## 4.	Demo
### Models
The code allows to run the models described in the manuscript on the full (163,896 datapoints) and a demo dataset (1,671 datapoints, i.e. 1% of the full dataset). Running the models on the demo dataset requires approximately 1.5 hours to complete on a “normal” laptop. The full model requires approximately 7 days to run on a super-computer.
## 5.	Instruction of use
### Models
The full, processed dataset is needed to run the full model pipeline. Requests will be considered according to the Data Availability Statement.
A demo dataset is provided to test teh code functinality through the "reduced" pipeline provided in *Models/Run_models.R*.

*Run models described in the manuscript.*
Open the script “Run_models.R” in R, making sure to 1) set up the correct working directory 2) replicate the same folder structure provided in Table 1. The script “Run_models.R” provides different pipelines for 1) the full vs. the demo dataset and 2) each model.
After having loaded the packages needed, select the model of interest, source the R file compiling the data for analysis (sub-folder “R_code”) and run the Stan model (subfolder “Stan_models"). For each model the rstan package returns the results as stanfit object which can be used to inspect and extract results using functions like print (summary of posterior distribution for each estimated parameter).
*Run model selection process.*
Open the script “Run_model_selection.R” in R, making sure to 1) set up the correct working directory 2) replicate the same folder structure provided in Table 1. For the submodels assessing a) consumption probability and b) frequency of consumption, the script “Run_models_selection.R” assess overfitting (pairs plot) and predictive power (ELPD) of the full model with and without a spatial autocorrealtion component (Gaussian process). For the submodel investigating c) quantity of wildmeat consumed, the script only assesses overfitting and predictive power of the full model (with continuous covariates) against a null model (with only random factors).
*Create figures and extract vlaues used to draw maps.*
Download the model results at https://doi.org/10.5281/zenodo.19021125O and save them in the subfolder "Results". Open the script "Create_figs_Extract_map_values.R" in R making sure to 1) set up the correct working directory 2) replicate the same folder structure provided in Table 1. Source the codes to draw figure and extract values needed to reproduce the maps shown in the paper. Files storing previously extracted predicted values are available in the subfolder "Results".
### Simulation
Open the script "Run_simulation.R" in R, making sure to 1) set up the correct working directory 2) replicate the same folder structure provided in Table 1. The script “Run_models.R” 1) sets up the real values of each parameter, 2) simulates n = 100 datasets for different survey covergaes (5, 10 and 15%) and 3) runs a simplified Bayesian model to retrieve the real parameters. For each parameter of interest the script returns a vector of n = 100 posterior distirbutions, which can then be used to assess the accuracy of the model in retrieving hte real parameters using plots or descriptive statistics.  To test the code, run only one repetition by simply set the parameter "n_rep" = 1 (line 12, *Simulation/Run_simulation.R*). 
