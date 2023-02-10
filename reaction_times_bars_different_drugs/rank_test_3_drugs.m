function h_p_vals = rank_test_3_drugs(drug_all, combinations)
    for c = 1:3
        comb = combinations(c, :);
        [h, p] = signrank(drug_all(:, comb(1)), drug_all(:, comb(2)));
        h_p_vals(c, :) = [h, p];
    end
end