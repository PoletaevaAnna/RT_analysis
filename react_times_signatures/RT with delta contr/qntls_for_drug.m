function [quantile_border, quant_centers] = qntls_for_drug(drug)
    [real_delta, ~, ~] = extract_delta_contrast(drug);
    qntls = 0: 1/4 : 1;
    quantile_border = quantile(real_delta, qntls);
    [~, ~, bins_] = histcounts(real_delta, quantile_border);
    
    for i = 1:4
        quant_centers(i) = median(real_delta(bins_ == i)); 
    end
end