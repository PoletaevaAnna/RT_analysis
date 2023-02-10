% The idea is to apply reaction_times_to_quantiles_for_slopes unction to each subject,
% separately and generate a table with reaction time medians for quantiles
% for each trial.

function [corr, err] = RT_each_trial_to_quantiles(data)
    empty_counter = 0;
    corr = [];
    err = [];
    for ii = 1:25
        subj = extract_subj_data(data, ii);
        if isempty(subj)
            empty_counter = empty_counter + 1;
        continue
        else
            ind = ii - empty_counter;
            [RT_corr, RT_err] = reaction_times_to_quantiles(subj);
            corr(ind, 1:4) = RT_corr;
            err(ind, 1:4) = RT_err;
        end
    end
end