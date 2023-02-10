function plot_RT_vs_corr(data, color)
    quant = 1:4;
    corr_table = each_trial_corr_to_RT(data);
    plot(quant, mean(corr_table, 1), 'Color', color, 'LineWidth', 4)
    hold on
    for i = 1:4
        scatter(i, corr_table(:, i), 'MarkerFaceColor',color, 'MarkerFaceAlpha',0.5)
        hold on
    end
    hold on
    for ii = 1:20
        plot(quant, corr_table(ii, :), 'Color', color, 'LineWidth', 0.3)
        hold on
    end
    sem = SEM_bars(corr_table);
    errorbar(quant, mean(corr_table, 1), sem, 'Color', 'k', 'CapSize', 14, 'LineWidth', 3, 'LineStyle','none')
    hold on 
end