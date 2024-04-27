# GEM_gmt
Genome-scale metabolic models in GMT format

## Introduction

Genome-scale metabolic models (GEMs) comprehensively describes the metabolites
and reactions of a metabolic network for a specific organism. GEMs have
been extensively used for gene set enrichment analysis, termed as reporter
metabolites analysis (RMA), to identify the metabolic pathways that are
significantly altered in a specific condition. However, GEMs are often
encoded as a model, and `gmt` format, which is employed by most GSEA tools such
as `piano`, is not readily available.

This repository provides most-recent GEMs in `gmt` format for Human, Mouse, and
Rat. These `gmt` files are generated based on 
[`Human-GEM`](https://github.com/SysBioChalmers/Human-GEM), 
[`Mouse-GEM`](https://github.com/SysBioChalmers/Mouse-GEM), and
[`Rat-GEM`](https://github.com/SysBioChalmers/Rat-GEM) models, respectively.

A Matlab script is also adapted from the 
[`updateHumanGMTs.m`](https://raw.githubusercontent.com/JonathanRob/GeneSetAnalysisMatlab/master/updateHumanGMTs.m) 
script to allow Matlab users to generate `gmt` files from GEMs from a variety of
organisms, for example, as provided by [Systems and Synthetic Biology at Chalmers University of Technology](https://github.com/SysBioChalmers).

## Dependency

Make sure you have Matlab installed on your machine. The script is tested on
Matlab R2024a.

## Installation

To install the script or use, either download the script or clone the repository
to your local machine.

```bash
cd /your/matlab_script_directory
git clone https://github.com/j-y26/GEM_gmt.git
```

This script also depends on functions from `GeneSetAnalysisMatlab` and 
`Human-GEM` repositories. Make sure you have them installed on your machine.

```bash
git clone https://github.com/JonathanRob/GeneSetAnalysisMatlab.git
git clone https://github.com/SysBioChalmers/Human-GEM.git
```

To allow matlab to access the functions from these repositories, add the paths
to the Matlab search path.

```matlab
addpath(genpath('/your/matlab_script_directory/GEM_gmt'))
addpath(genpath('/your/matlab_script_directory/GeneSetAnalysisMatlab'))
addpath(genpath('/your/matlab_script_directory/Human-GEM/code/GPRs'))
```

Save the path to the Matlab search path.

```matlab
savepath
```

## Usage

To generate `gmt` files from GEMs, you must first load the GEMs into Matlab
workspace. For example, to load the Human-GEM model, you can use the following
commands.

```matlab
cd /your/matlab_script_directory/Human-GEM/model
load('Human-GEM.mat')
```

Then, you can generate the `gmt` files by running the following command.

```matlab
model2GMTs(model, '/my/output/directory')
```

The `model2GMTs` function will convert the matlab models into `gmt` files and
save them in the specified output directory.

This function has been tested on Human, Mouse, and Rat GEMs. It should work on
other GEMs as well, but it is not guaranteed. Please submit an issue if you
encounter any problems.

## License

This repository is licensed under the GNU General Public License v3.0. Please
see the [LICENSE](LICENSE) file for more information.