clear
close all
cd ('C:\Users\Anna Poletaeva\Desktop\research project')

load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('compare diff conf\')
correct_all_data = right_confidence(Data);
st = correctness_quant_by_contr(correct_all_data);
qntls = [1:4];
figure(1)
set(gcf, 'Position', [1 1 400 400])

sem = SEM_bars(st);
plot(qntls, mean(st, 1), 'LineWidth', 5)
hold on
scatter(qntls, st, 60, 'filled', 'MarkerFaceColor', [0, 0.4470, 0.7410], 'MarkerFaceAlpha', 0.3)
hold on
errorbar(qntls, mean(st, 1), sem, 'Color', 'k', 'LineWidth', 3, 'CapSize',10, 'LineStyle','none')
xticks([1 2 3 4])
xlim([0.9 4.1])
ylim([0.4 1])
xlabel('Quantiles (reaction time)')
ylabel('Fraction of correct trials')
set(gca, 'FontSize', 16)

cor_coef_arr = [];

for i = 1:20
    cc = corrcoef(qntls, st(i, :));
    cor_coef_arr(i) = cc(1, 2);
end
figure(2)
set(gcf, 'Position', [1 1 500 200])
scatter(cor_coef_arr, 1, 200, 'filled', 'MarkerFaceAlpha', 0.5)
hold on
line([mean(cor_coef_arr), mean(cor_coef_arr)], [0.975, 1.025], 'Color', 'k', 'LineWidth', 3)
text(mean(cor_coef_arr), 1.035, num2str(round(mean(cor_coef_arr), 4)), 'FontSize', 16)
ylim([0.97 1.05])
xlim([0.979 1.001])
yticks([1])
yticklabels([])
xticks([0.98 0.99 1])
xlabel('Pearson correlation coefficient')
title('Correctness-RT correlation')
set(gca, 'FontSize', 16)

%%
figure()
colors =[    0    162   255;

     255/2    255/2   255/2;

    238 34 12]./255;
quant = [1:4];
slopes = [];
for d = 1:3
    drug_data = Data((Data.Drug_ID == d), :);
    this_drug = correctness_quant_by_contr(drug_data);
    for i = 1:size(this_drug, 1)
        p = polyfit(quant, this_drug(i, :), 1)
        slopes(i, d) = p(2);
    end
    sem = SEM_bars(this_drug);
    shadedErrorBar(quant, mean(this_drug, 1), sem, 'LineProps', {'Color', colors(d, :)})
    hold on
end
hold off
figure()
dr = [1:3]
scatter(dr, slopes)
hold on
generate_sigline(0.05, slopes, 0.02, [1 2; 2 3; 1 3], 0.3)
