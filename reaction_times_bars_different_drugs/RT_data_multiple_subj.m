% The output of this function is 3 values and one table. Values are medians
% of reaction times of all, correct and error trials - these values are
% calculated across all subjects. A table stores the same values for each
% subject, separately. Values from the table are than used to calculate
% SEM.

function [RT_table, RTall, RTcorr, RTerr] = RT_data_multiple_subj(data)
    empty_counter = 0;
    RT_table = [];
    [RTall, RTcorr, RTerr] = calc_react_time(data);
    for i = 1:25
        %subj_data = [];
        subj_data = extract_subj_data(data, i);
        if isempty(subj_data)
            empty_counter = empty_counter + 1;
        continue
        else
            [RT_all, RT_corr, RT_err] = calc_react_time(subj_data);
            RT_table(i-empty_counter, 1:3) = [RT_all, RT_corr, RT_err];
        end
    end
end