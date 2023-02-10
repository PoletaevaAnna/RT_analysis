function subj_tog = correctness_quant_by_contr(data)
    subj_tog = [];
    empty_counter = 0;
    for ii = 1:25
        subj = extract_subj_data(data, ii);
        if isempty(subj)
            empty_counter = empty_counter + 1;
        continue
        else
            ind = ii - empty_counter;
            real_delta = abs(mean(subj.contrast_left, 2) - mean(subj.contrast_right, 2));
           % real_delta = subj.choice_rt;
% 
%     [real_delta, real_delta_low, real_delta_high] = extract_delta_diff_conf(subj);
%     correctness_low = subj.correct(subj.confidence == 1);
%     correctness_high = subj.correct(subj.confidence == 2);
   
            qntls = 0: 1/4 : 1;
            quantile_border = quantile(real_delta, qntls);
        
            [~, ~, bins_]= histcounts(real_delta, quantile_border);
            %[~, ~, bins_high] = histcounts(real_delta_high, quantile_border);
            correct= [];
            corctns = subj.correct;
            for i = 1:4
                correct = [correct, mean(corctns(bins_ == i))];
            end
            subj_tog(ind, :) = correct;
        end
    end
end