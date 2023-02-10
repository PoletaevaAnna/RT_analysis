function correctness = corr_vs_delta_contr(data)
    empty_counter = 0;
    for ii = 1:25
        sub = extract_subj_data(data, ii);
        if isempty(sub)
            empty_counter = empty_counter + 1;
        continue
        else
            subj = sub(~isnan(sub.correct), :);
            [real_delta, ~, ~] = extract_delta_contrast(subj);
            correct = subj.correct;
            qntls = 0: 1/4 : 1;
            quantile_border = quantile(real_delta, qntls);
            [~, ~, bins_] = histcounts(real_delta, quantile_border);
            for i = 1:4
                corr(i) = mean(correct(bins_ == i));
            end
            correctness((ii - empty_counter), :) = corr;
        end
    end
end