close all
clear
cd ('C:\Users\Anna Poletaeva\Desktop\research project')

load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('reaction_times_bars_different_drugs\')
edges = [0 : 0.01: 1];
for d = 1:3
    drug_data = Data((Data.Drug_ID == d), :);
    [high, low] = separate_by_difficulty(drug_data);
    [contr_high, ~, ~] = extract_delta_contrast(high);
    [contr_low, ~, ~] = extract_delta_contrast(low);
    RT_high = high.choice_rt;
    RT_low = low.choice_rt;
    subplot(2, 3, d)
    histogram(contr_high, edges, 'FaceAlpha', 0.5, 'Normalization','pdf')
    hold on
    histogram(contr_low, edges, 'FaceAlpha', 0.5, 'Normalization','pdf')
    hold on
    subplot(2, 3, d+3)
    histogram(RT_high, edges, 'FaceAlpha', 0.5, 'Normalization','pdf')
    hold on
    histogram(RT_low, edges, 'FaceAlpha', 0.5, 'Normalization','pdf')

end

