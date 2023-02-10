clear
close all
cd ('C:\Users\Anna Poletaeva\Desktop\research project')

load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('compare diff conf\')
correct_all_data = right_confidence(Data);
drugs = [{'Lorazepam', 'Placebo', 'Memantine'}];
figure(1)
set(gcf, 'Position', [1 1 1100 400])
t = tiledlayout(1, 3, 'TileSpacing','compact');

for i = 1:3
    drug_data = correct_all_data((correct_all_data.Drug_ID == i), :);
    nexttile
    plot_correctness_diff_conf(drug_data)
    title(drugs(i))
    ylim([0.46 1])
    xlim([0.85 4.15])
    if (i == 2)|| (i == 3)
        ax = gca;
        ax.YTickLabel = [];
    else
        ylabel('Fraction of correct trials')
    end
    set(gca, 'FontSize', 17)
    xticks([1 2 3 4])
end
%set(gca, 'FontSize', 18)
xlabel(t, 'Quantile (delta contrast)', 'FontSize', 17)

legend({'low confidence', 'high confidence'}, 'Location', 'bestoutside')

figure(2)
set(gcf, 'Position', [1 1 500 400])
plot_correctness_diff_conf(correct_all_data)
ylim([0.46 1])
xlim([0.85 4.15])
xlabel('Quantile (delta contrast)', 'FontSize', 17)
legend({'low confidence', 'high confidence'}, 'Location', 'bestoutside')
xticks([1 2 3 4])
ylabel('Fraction of correct trials')
%title(['Fraction of correct trials' newline 'for different delta contrast'])
set(gca, 'FontSize', 16)

figure(3)
