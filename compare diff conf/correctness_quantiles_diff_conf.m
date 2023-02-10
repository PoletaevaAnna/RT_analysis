function [low_conf, high_conf] = correctness_quantiles_diff_conf(subj)

    [real_delta, real_delta_low, real_delta_high] = extract_delta_diff_conf(subj);
    correctness_low = subj.correct(subj.confidence == 1);
    correctness_high = subj.correct(subj.confidence == 2);
   
    qntls = 0: 1/4 : 1;
    quantile_border = quantile(real_delta, qntls);

    [~, ~, bins_low]= histcounts(real_delta_low, quantile_border);
    [~, ~, bins_high] = histcounts(real_delta_high, quantile_border);

    low_conf = [];
    high_conf = [];
    for i = 1:4
        low_conf = [low_conf, mean(correctness_low(bins_low == i))];
        high_conf = [high_conf, mean(correctness_high(bins_high == i))];
    end
end