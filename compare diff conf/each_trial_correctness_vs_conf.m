function [high_conf, low_conf] = each_trial_correctness_vs_conf(data)
    empty_counter = 0;
    high_conf = [];
    low_conf = [];
    for ii = 1:25
        subj = extract_subj_data(data, ii);
        if isempty(subj)
            empty_counter = empty_counter + 1;
        continue
        else
            ind = ii - empty_counter;
            highconf = subj((subj.confidence == 2), :);
            lowconf = subj((subj.confidence == 1), :);
            high_conf(ind) = mean(highconf.correct);
            low_conf(ind) = mean(lowconf.correct);
        end
    end
end

