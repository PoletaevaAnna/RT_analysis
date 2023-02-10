function [RT_high, RT_low] = RT_mult_subj_difficulty(data)
    empty_counter = 0;
    RT_table = [];
   % [RTall, RTcorr, RTerr] = calc_react_time(data);
    for i = 1:25
        %subj_data = [];
        subj_data = extract_subj_data(data, i);
        if isempty(subj_data)
            empty_counter = empty_counter + 1;
        continue
        else
            [high, low] = separate_by_difficulty(subj_data);
            [h, ~, ~] = calc_react_time(high);
            [l, ~, ~] = calc_react_time(low);
            RT_high(i - empty_counter, 1) = h;
            RT_low(i-empty_counter, 1) = l;
        end
    end
end