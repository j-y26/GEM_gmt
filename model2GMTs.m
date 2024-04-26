function [] = model2GMTs(model, outdir)
%model2GMTs  Create updated gene set collection files from GEMs.
%
% NOTE: Requires functions from the Human-GEM GitHub repository!
%
% This function is used to update the gene set collection (GSC) files
% (.gmt files) derived from GEMs.
% GSC files will be generated for metabolites (with and without
% compartments) and subsystems, and for Ensembl (ENSG) IDs and gene
% symbols. The version of the GEM model used will be included in the
% output filenames.
%
% model: a GEM model that is already loaded into matlab
% outdir: the name of the directory where the output gmt files are stored
%

% Only Human-GEM by default encodes ensembl ids, other species use symbol
% Check if the species is Human
is_human = contains(model.id, "Human", "IgnoreCase",true);

%% Default GEM gene annotation
% if Human, then output is ensembl ID
% if not, then defult is gene symbol

if is_human
    model_anno = '_ensembl_';
else
    model_anno = '_symbols_';
end

% metabolites without compartments
outfile = [model.id '_v' model.version model_anno 'metabolites.gmt'];
outfile = fullfile(outdir, outfile);
extractMetaboliteGSC(model, false, outfile);

% metabolites with compartments
outfile = [model.id '_v' model.version model_anno 'metabolites_comps.gmt'];
outfile = fullfile(outdir, outfile);
extractMetaboliteGSC(model, true, outfile);

% subsystems (excluding some uninformative subsystems)
outfile = [model.id '_v' model.version model_anno 'subsystems.gmt'];
outfile = fullfile(outdir, outfile);
extractSubsystemGSC(model, {'Artificial reactions','Pool reactions','Miscellaneous','Isolated'}, outfile);


%% Translate Ensembl ID to Symbol
% Convert Human-GEM gene IDs to gene symbols
% NOTE: Requires that the Human-GEM GitHub repository is on the MATLAB Path

% Run only if GEM is for Human
if is_human
    [model.grRules, model.genes, model.rxnGeneMat] = translateGrRules(model.grRules, 'Name', 'ENSG');
    
    % metabolites without compartments
    outfile = [model.id '_v' model.version '_symbols_metabolites.gmt'];
    outfile = fullfile(outdir, outfile);
    extractMetaboliteGSC(model, false, outfile);
    
    % metabolites with compartments
    outfile = [model.id '_v' model.version '_symbols_metabolites_comps.gmt'];
    outfile = fullfile(outdir, outfile);
    extractMetaboliteGSC(model, true, outfile);
    
    % subsystems (excluding some uninformative subsystems)
    outfile = [model.id '_v' model.version '_symbols_subsystems.gmt'];
    outfile = fullfile(outdir, outfile);
    extractSubsystemGSC(model, {'Artificial reactions','Pool reactions','Miscellaneous','Isolated'}, outfile);
end