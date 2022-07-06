% List of open inputs
% Tissue Volumes: Segmentation mat-files - cfg_files
nrun = X; % enter the number of runs here
jobfile = {'/home/glatard/code/livingpark/scherfler-etal/batches/tissue_volumes_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(1, nrun);
for crun = 1:nrun
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % Tissue Volumes: Segmentation mat-files - cfg_files
end
spm('defaults', 'PET');
spm_jobman('run', jobs, inputs{:});
