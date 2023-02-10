function [RT, RT_corr] = reaction_times_together(data)
    empty_counter = 0;
    RT = [];
    RT_corr = [];
    for ii = 1:25
        subj = extract_subj_data(data, ii);
        if isempty(subj)
            empty_counter = empty_counter + 1;
        continue
        else
            ind = ii - empty_counter;
            [delta, delta_corr, ~] = extract_delta_contrast(subj);
            qntls = 0: 1/4 : 1;
            quantile_border = quantile(delta, qntls);
            [~, ~, bins_] = histcounts(delta, quantile_border);
            [~, ~, bins_corr] = histcounts(delta_corr, quantile_border);
            react_times_correct = subj.choice_rt(subj.correct == 1);
            react_times = subj.choice_rt;
            RT_subj = [];
            RT_subj_corr = [];
    
            for i = 1:4
                RT_subj = [RT_subj, median(react_times(bins_ == i))];
                RT_subj_corr = [RT_subj_corr, median(react_times_correct(bins_corr == i))];
            end
            RT(ind, :) = RT_subj;
            RT_corr(ind, :) = RT_subj_corr;

        end
    end
end