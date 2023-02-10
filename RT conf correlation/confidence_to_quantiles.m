function [conf_corr, conf_err] = confidence_to_quantiles(subj)
    [real_delta, real_delta_correct, real_delta_error] = extract_delta_contrast(subj);
    conf_correct = subj.confidence(subj.correct == 1);
    conf_error = subj.confidence(subj.correct == 0);
    qntls = 0: 1/4 : 1;
    quantile_border = quantile(real_delta, qntls);

    [~, ~, bins_corr]= histcounts(real_delta_correct, quantile_border);
    [~, ~, bins_err] = histcounts(real_delta_error, quantile_border);
    conf_corr = [];
    conf_err = [];
    for i = 1:4
        conf_corr = [conf_corr, mean(conf_correct(bins_corr == i)) - 1];
        conf_err = [conf_err, mean(conf_error(bins_err == i)) - 1];
    end
end