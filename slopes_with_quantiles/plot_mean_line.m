function plot_mean_line(x, data_y)
    y = mean(data_y);
    line([x - 0.15, x + 0.15], [y, y], 'LineWidth', 4, 'Color', 'k')
end