clear
cd ('C:\Users\Anna Poletaeva\Desktop\research project')
close
load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('react_times_correct_and_error\RT with quant\')
figure(1)
set(gcf, 'Position', [1 1 1200 400])
t = tiledlayout(1,3);
t.TileSpacing = 'compact';
titles = ({'Lorazepam' 'Placebo' 'Memantine'});
colors =[    0    162   255;

     255/2    255/2   255/2;

    238 34 12]./255;

for i = 1:3
    nexttile
    drug_data = Data((Data.Drug_ID == i), :);
    plot_RT_vs_corr(drug_data, colors(i, :))
    title(titles(i), 'FontSize', 24)
    ax = gca;
    if (i == 2)|| (i == 3)
        
        ax.YTickLabel = [];
        ax.FontSize = 18;
    else
        ylabel('Fraction of correct trials', 'FontSize', 22)
    end
    
    ax.FontSize = 18;
    ylim([0.5 1])
    xlim([0.9 4.1])
end

xlabel(t, 'Quantiles (reaction time)', 'FontSize', 20)

close all
figure(2)
set(gcf, 'Position', [1 1 600 600])
plot_RT_vs_corr(Data, [0 0.4470 0.7410])
title(['Fraction of correct trials' newline 'for different reaction times'])
xlabel('Quantiles (reaction time)')
ylabel('Fraction of correct trials')
ylim([0.6 0.86])
xlim([0.9 4.1])
set(gca, 'FontSize', 18)

qnt = 1:4;
corr_table = each_trial_corr_to_RT(Data);
close
for ii = 1:20
    r = corrcoef(qnt, corr_table(ii, :));
    cor_together(ii) = r(1, 2);
end

set(gcf, 'Position', [1 1 500 800])
scatter(1, cor_together, 250, 'filled', 'MarkerFaceAlpha', 0.5)
hold on
x = 1;
y = mean(cor_together);
line([x - 0.02, x+ 0.02], [y y], 'Color', 'k','LineWidth', 4)
xlim([0.9 1.1])
xticks([1])
xticklabels([])
ylim([-1.03 -0.75])
yline(-1, 'LineStyle', '--', 'LineWidth', 1)
ylabel('Pearson correlation coefficient')
title(['Coefficients of correlation for' newline 'fraction of correct trials' newline 'and reaction time'])
set(gca, 'FontSize', 18)


