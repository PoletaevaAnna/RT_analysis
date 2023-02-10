function corr_table = each_trial_corr_to_RT(data)
    empty_counter = 0;
    for ii = 1:25
        subj = extract_subj_data(data, ii);
        if isempty(subj)
            empty_counter = empty_counter + 1;
        continue
        else
            corr = correctness_to_quant_by_RT(subj);
            corr_table(ii - empty_counter, :) = corr;
        end
    end
end
