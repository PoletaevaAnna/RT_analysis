close all
clear
cd ('C:\Users\Anna Poletaeva\Desktop\research project')

load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('reaction_times_bars_different_drugs\')

for i = 1:3
    drug_data = Data((Data.Drug_ID == i), :);

    [RTtable, ~, ~, ~] = RT_data_multiple_subj(drug_data);
    drug_RT_all(:, i) = RTtable(:, 1);
%     drug_RT_corr(:, i) = RTtable(:, 2);
%     drug_RT_err(:, i) = RTtable(:, 3)
end
save('drugs_RT.mat', 'drug_RT_all')
drug_sem = SEM_bars(drug_RT_all);
colors =[    0    162   255;

     255/2    255/2   255/2;

    238 34 12]./255;
%bar_names = categorical({'drug 1', 'drug 2', 'drug 3'});
means = mean(drug_RT_all, 1);
b = bar(means);
hold on
for ii = 1:3
    bar(ii, means(ii), 'FaceColor', colors(ii, :))
    hold on
    scatter(ii,  drug_RT_all(:, ii), 'MarkerFaceColor', 'k', 'MarkerFaceAlpha', 0.5)
    hold on
    errorbar(ii, means(ii), drug_sem(ii), 'LineStyle', 'none', 'LineWidth',4, 'CapSize', 14, 'Color', 'k')
end
hold on
combinations = [1 2; 2 3; 1 3];
h_p_vals = rank_test_3_drugs(drug_RT_all, combinations);

init_sigline_height = 0.77;

step = 0.08;
generate_sigline(init_sigline_height, drug_RT_all, step, combinations, 0.35)

set(gca,'xticklabel', {'Lorazepam', 'Placebo', 'Memantine'})
ylabel('Reaction time, s')
title('Average reaction time')
ylim([0 1.1])
set(gca, 'FontSize', 17)
xlim([0.3 3.8])
% 
% [p11, h11] = signrank(drug_RT_corr(:, 2), drug_RT_corr(:, 1));
% [p21, h21] = signrank(drug_RT_corr(:, 2), drug_RT_corr(:, 3));
% 
% [p12, h12] = signrank(drug_RT_err(:, 2), drug_RT_err(:, 1));
% [p22, h22] = signrank(drug_RT_err(:, 2), drug_RT_err(:, 3));