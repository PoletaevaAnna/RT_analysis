% Any input that has choise and correct columns can be provided.
% RT_all considers all the trials, except for the ones that have Nan as a
% result. Nan has to be excluded, otherwise the output of median () is also
% Nan. To exclude Nan, all the values that are NOT Nan (sign for NOT is ~)
% are taken.
% Correct trails can be referred by a value 1 in the correct column.
% Error trials can be referred by a value 0 in the correct column.
function [RT_all, RT_corr, RT_err] = calc_react_time(inp)
    RT_all = median(inp.choice_rt(~isnan(inp.correct)));
    RT_corr = median(inp.choice_rt(inp.correct == 1));
    RT_err = median(inp.choice_rt(inp.correct == 0));
end