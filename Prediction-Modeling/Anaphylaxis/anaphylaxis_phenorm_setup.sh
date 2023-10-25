#!/bin/bash

# Project-specific setup

# edit the following lines based on the analysis and directory structure -------
# CUI of interest
cui_of_interest="C1971"
# model development site and external validation site
site="kpwa"
# external_site="<replace with the external validation site, if any>"
# dataset name
data_name="mock_data.rds"
# analysis name
analysis_name="anaphylaxis"
# directory
dir_prefix="/mnt/c/Users/L107067/OneDrive - Kaiser Permanente/Code/Sentinel-Scalable-NLP/Prediction-Modeling/"
dir="${dir_prefix}Anaphylaxis/"
# dataset directory
data_dir="${dir_prefix}sandbox/"
# random number seed, can be edited
rng_seed=20231024
# set up analysis options ------------------------------------------------------
# set to the defaults
# toggle negation on/off, defaults to TRUE
use_negation=0
# toggle dimension reduction on/off, defaults to FALSE
use_dimension_reduction=0
# should we use non-normalized, normalized NLP variables? nonnormalized defaults to TRUE, normalized defaults to FALSE
use_nonnormalized_data=1
use_normalized_data=0
# should we train on gold-labeled data as well? defaults to FALSE
train_on_gold_data=0
# tuning parameters for PheNorm, also set to the defaults
corrupt_rate=0.3
train_size_mult=13
# Variable names and helpful values
valid_label="Train_Eval_Set"
train_value="1"
nonneg_label="_nonneg"
study_id="Studyid"
util_var="Utiliz"
weight_var="Sampling_Weight"
gold_label="PTYPE_POSITIVE"
chart_reviewed=FALSE

# directory setup, based on entries above --------------------------------------
# these directories are specified by the directories above
analysis_data_dir="${dir}/PheNorm/analysis_datasets_negation_${use_negation}_normalization_${use_normalized_data}_dimension-reduction_${use_dimension_reduction}_train-on-gold_${train_on_gold_data}/"
output_dir="${dir}/PheNorm/results_negation_${use_negation}_normalization_${use_normalized_data}_dimension-reduction_${use_dimension_reduction}_train-on-gold_${train_on_gold_data}/"

mkdir -p "${dir}/PheNorm"
# set up i/o output directory 
io_dir="phenorm_io_files_negation_${use_negation}_normalization_${use_normalized_data}_dimension-reduction_${use_dimension_reduction}_train-on-gold_${train_on_gold_data}"
mkdir -p ${io_dir}

gold_label_arry=(${gold_label})
analyses=(${analysis_name})
data_names=(${data_name})
n_analyses=${#analyses[@]}
n_datasets=${#data_names[@]}
