function correctness = correctness_to_quant_by_RT(data)
    RT = data.choice_rt;
    correct = data.correct;
    qntls = 0: 1/4 : 1;
    quantile_border = quantile(RT, qntls);
    [~, ~, bins_] = histcounts(RT, quantile_border);
    for i = 1:4
        correctness(i) = mean(correct(bins_ == i));
    end
end