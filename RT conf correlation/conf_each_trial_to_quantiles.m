function [cfd_corr, cfd_err] = conf_each_trial_to_quantiles(drug)
    empty_counter = 0;
    for ii = 1:25
        subj = extract_subj_data(drug, ii);
        if isempty(subj)
            empty_counter = empty_counter + 1;
        continue
        else
            ind = ii - empty_counter;
            [conf_corr, conf_err] = confidence_to_quantiles(subj);
            cfd_corr(ind, :) = conf_corr;
            cfd_err(ind, :) = conf_err;
        end
    end
end