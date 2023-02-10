% The idea is to apply reaction_times_to_quantiles unction to each subject,
% separately and generate a table with reaction time medians for quantiles
% for each trial.
% In the end, we have 3 data sets, each consists of 4 columns for each
% quantile and 20 rows for each drug.
function [rt_corr_data, rt_err_data, quant_ctr] = each_trial_to_quantiles_with_contrast(drug)
    empty_counter = 0;
    for ii = 1:25
        subj = extract_subj_data(drug, ii);
        if isempty(subj)
            empty_counter = empty_counter + 1;
        continue
        else
            ind = ii - empty_counter;
            [quant_ctr, RT_corr, RT_err] = reaction_times_to_quantiles(subj, drug);
            rt_corr_data(ind, :) = RT_corr;
            rt_err_data(ind, :) = RT_err;
        end
    end
end