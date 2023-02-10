% Plots values, derived by the fucntion react_times_to_quantiles_with_sems.
% RT_corr and RT_err are reaction times for all subjects, quant_cntr is
% quantile center, which is also derived from all the data. SEMs are found
% by computing RT (correct and error, separately) for each individual
% trail. And then appying SEM formula to each column of generated values.

function plot_react_times_and_sem_quantiles(data)
    [RT_corr, RT_err, ~, sems] = react_times_to_quantiles_with_sems(data);
    quant = 1:4;
    plot(quant, RT_corr, 'Color', "#77AC30", 'Linewidth', 4, 'LineStyle', '-');
    hold on
    plot(quant, RT_err, 'Color', "#A2142F", 'Linewidth', 4, 'LineStyle', '-');
    hold on
    for q = 1:4
        errorbar(q, RT_corr(q), sems(1, q), 'Color', 'green', ...
        'CapSize', 16, 'LineWidth', 3, 'LineStyle', 'none')
        hold on
        errorbar(q, RT_err(q), sems(2, q), 'Color', 'red', ...
        'CapSize', 16, 'LineWidth', 3, 'LineStyle', 'none')
        hold on
    end
     xlim([0.9 4.1])
     ylim([0.3 0.6])
     xticks([1 2 3 4])
    hold off
end