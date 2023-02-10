clear
cd ('C:\Users\Anna Poletaeva\Desktop\research project')
%close
load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('react_times_correct_and_error\RT with quant\')


corr = corr_vs_delta_contr(Data);
qntls = 1:4;
%Finding the correlation
for i = 1:20
    r = corrcoef(qntls, corr(i, :));
    cc_together(i) = r(1, 2);
end
figure(1)
set(gcf, 'Position', [1 1 600 700])
plot(qntls, corr(:, qntls), 'Color', [0 0.4470 0.7410])
hold on 
scatter(qntls, corr(:, qntls), 20, 'MarkerFaceColor', [0 0.4470 0.7410], 'MarkerFaceAlpha', 0.5)
hold on
plot(qntls, mean(corr, 1), 'Color', [0 0.4470 0.7410], 'LineWidth', 4)
hold on
sem = SEM_bars(corr);
errorbar(qntls, mean(corr, 1), sem, 'k', 'LineWidth', 3, 'LineStyle','none', 'CapSize', 14)
xticks([1 2 3 4])
xlim([0.9 4.1])
ylim([0.45 1])
xlabel('Quantiles (delta contrast)')
ylabel('Fraction of correct trials')
title(['Fraction of correct trials' newline ' for different evidence strength'])
set(gca, 'FontSize', 18)


close
figure(2)
set(gcf, 'Position', [1 1 500 800])
scatter(1, cc_together, 250, 'filled', 'MarkerFaceAlpha', 0.5)
hold on
x = 1;
y = mean(cc_together);
line([x - 0.02, x+ 0.02], [y y], 'Color', 'k','LineWidth', 4)
xlim([0.9 1.1])
xticks([1])
xticklabels([])
ylim([0.96 1])
ylabel('Pearson correlation coefficient')
title(['Coefficients of correlation for' newline 'fraction of correct trials' newline 'and delta contrast'])
set(gca, 'FontSize', 18)





