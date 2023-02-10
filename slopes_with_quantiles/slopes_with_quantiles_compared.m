% For each drug: find each_trial_to_quantiles.
clear
cd ('C:\Users\Anna Poletaeva\Desktop\research project')

load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('slopes_with_quantiles\')
quant = 1:4;
figure(1)
set(gcf, 'Position', [1 1 1200 600])
for i = 1:3
    drug_data = Data((Data.Drug_ID == i), :);
    [corr, err] = each_trial_to_quantiles(drug_data);
%     figure(1)
%     set(gcf, 'Position', [1 1 1000 350])
%     subplot(1, 3, i)
    colors =[    0    162   255;

     255/2    255/2   255/2;

    238 34 12]./255; 
    slope = err - corr;
    subplot(2, 2, [1 3])
    sem = SEM_bars(slope);
    shadedErrorBar(quant, mean(slope, 1), sem, 'lineProps',{'Color', colors(i, :), 'LineWidth', 5})
    hold on
    [lin_coeff, intercept] = fitting_slope(slope);
    lin_coef_all(:, i) = lin_coeff;
    start_point_all(:, i) = intercept;
    subplot(2, 2, 4)
    scatter(i, lin_coeff, 60, 'MarkerFaceColor', colors(i, :), 'MarkerFaceAlpha', 0.5)
    hold on
    plot_mean_line(i, lin_coeff)
    hold on
    subplot(2, 2, 2)
    scatter(i, intercept, 60, 'MarkerFaceColor', colors(i, :), 'MarkerFaceAlpha', 0.5)
    hold on
    plot_mean_line(i, intercept)
    hold on
%     title('Drug', num2str(i))
%     ylim([-0.1 0.35])
%     ylabel('Reaction time, s')
%     xlabel('Quantile')
end

combinations = [1 2; 2 3; 1 3];
subplot(2, 2, 4)
h_p_vals = rank_test_3_drugs(lin_coef_all, combinations);

generate_sigline(0.12, lin_coef_all, 0.05, combinations, 0.4)
xlim([0.3 3.8])
ylim([-0.05 0.33])
xticks([1 2 3])
set(gca,'xticklabel', {'Lorazepam', 'Placebo', 'Memantine'})
ylabel('Slope coefficient')
title('Slopes')
set(gca, 'FontSize', 16)
%generate_sigline()
subplot(2, 2, 2)
h_p_vals = rank_test_3_drugs(start_point_all, combinations);

generate_sigline(0.12, start_point_all, 0.05, combinations, 0.4)

xlim([0.3 3.8])
ylim([-0.1 0.33])
xticks([1 2 3])
set(gca,'xticklabel', {'Lorazepam', 'Placebo', 'Memantine'})
ylabel('Intercept value')
title('Intercepts')
set(gca, 'FontSize', 16)

subplot(2, 2, [1 3])
xlim([0.9 4.1])
ylim([-0.02 0.16])
xticks([1 2 3 4])
xlabel('Quantile')
ylabel('Error-correct reaction time difference')
title('Mean reaction time difference')
legend({'Lorazepam', 'Placebo', 'Memantine'}, 'Location', 'southeast', 'Fontsize', 18)
set(gca, 'FontSize', 16)



