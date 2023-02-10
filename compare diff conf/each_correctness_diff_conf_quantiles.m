function [low_cnf, high_cnf] = each_correctness_diff_conf_quantiles(drug)
    empty_counter = 0;
    for ii = 1:25
        subj = extract_subj_data(drug, ii);
        if isempty(subj)
            empty_counter = empty_counter + 1;
        continue
        else
            ind = ii - empty_counter;
            [low, high] = correctness_quantiles_diff_conf(subj);
            low_cnf(ind, :) = low;
            high_cnf(ind, :) = high;
        end
    end
end