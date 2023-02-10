% The fucntion derives reaction times for quantiles of all trials. Then, it
% generates a table of reaction times for individual trials and computes
% SEMs. All these values are further plotted by a fucntion
% plot_react_times_and_sem_quantiles.

function [rt_corr, rt_err, qnt_cntr, sems] = react_times_to_quantiles_with_sems(data)
% In this part, 3 tables are generated.
    [RT_corr, RT_err, quant_cntr] = each_trial_to_quantiles_with_contrast(data);
% The next part generates means for each of the quantiles from tables: mean
% is calculated for RT correct, RT error and quantile centers.
    rt_corr = mean(RT_corr, 1);
    rt_err = mean(RT_err, 1);
    qnt_cntr = mean(quant_cntr, 1);
    sems(1, :) = SEM_bars(RT_corr);
    sems(2, :) = SEM_bars(RT_err);
end