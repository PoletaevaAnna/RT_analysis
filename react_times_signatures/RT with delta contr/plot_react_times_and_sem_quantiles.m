% Plots values, derived by the fucntion react_times_to_quantiles_with_sems.
% RT_corr and RT_err are reaction times for all subjects, quant_cntr is
% quantile center, which is also derived from all the data. SEMs are found
% by computing RT (correct and error, separately) for each individual
% trail. And then appying SEM formula to each column of generated values.

function plot_react_times_and_sem_quantiles(data)
    [RT_corr, RT_err, qnt_cntr, sems] = react_times_to_quantiles_with_sems(data);
    plot(qnt_cntr, RT_corr, 'Color', "#77AC30", 'Linewidth', 5, 'LineStyle', '-');
    hold on
    plot(qnt_cntr, RT_err, 'Color', "#A2142F", 'Linewidth', 5, 'LineStyle', '-');
    hold on
    errorbar(qnt_cntr, RT_corr, sems(1, :), 'Color', 'green', ...
    'CapSize', 18, 'LineWidth', 3, 'LineStyle', 'none')
    hold on
    errorbar(qnt_cntr, RT_err, sems(2, :), 'Color', 'red', ...
    'CapSize', 18, 'LineWidth', 3, 'LineStyle', 'none')
    hold on
    xlim([0 0.16])
    ylim([0.3 0.6])
    hold off
end