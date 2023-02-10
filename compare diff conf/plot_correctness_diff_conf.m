function plot_correctness_diff_conf(data)
    [low, high]= each_correctness_diff_conf_quantiles(data);
    qntl = 1:4;
    plot(qntl, mean(low, 1), 'Color', "#4DBEEE", 'LineWidth', 4)
    hold on
    plot(qntl, mean(high, 1), 'Color', "#0072BD", 'LineWidth', 4)
    hold on
    sem_low = SEM_bars(low);
    errorbar(qntl, mean(low, 1), sem_low, 'CapSize', 14, 'LineWidth', 3, 'LineStyle', 'none', ...
        'Color', [0.1 0.4 0.8])
    hold on
    sem_high = SEM_bars(high);
    errorbar(qntl, mean(high, 1), sem_high, 'CapSize', 14, 'LineWidth', 3, ...
        'LineStyle', 'none', 'Color', [0 0.2 0.8])
end