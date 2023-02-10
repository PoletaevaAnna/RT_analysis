clear
close all
cd ('C:\Users\Anna Poletaeva\Desktop\research project')

load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('reaction_times_bars\')
figure()
set(gcf, 'Position', [1 1 400 500])
[RT_table, ~, ~, ~] = RT_data_multiple_subj(Data);
save('RT_table.mat', 'RT_table')
sem = SEM_bars(RT_table);
vals = mean(RT_table, 1);
%bars = categorical({'all', 'correct', 'error'});
b1 = bar(1, vals(1), 'FaceColor', 'flat', 'CData', [0 0.4470 0.7410]);
hold on
b2 = bar(2, vals(2), 'FaceColor', 'flat', 'CData', [0.4660 0.6740 0.1880]);
hold on
b3 = bar(3, vals(3), 'FaceColor', 'flat', 'CData', [0.6350 0.0780 0.1840]);

hold on
for i = 1: 3
    
    scatter(i, RT_table(:, i), 60, 'MarkerFaceColor', 'k', 'MarkerFaceAlpha', 0.3)
    hold on
    errorbar(i, vals(i), sem(i), 'LineStyle', 'none', 'LineWidth',3, 'CapSize', 10, 'Color', 'k');
    hold on
end
ylim([0 0.9])
xticks([1 2 3])
xticklabels({'all', 'correct', 'error'})

set(gca, 'FontSize', 17)
hold off
ylabel('Reaction time, s')
xlim([0.3 3.7])
title('Mean reaction times')

% Testing whether correct reaction time is different to error
[p, h]= signrank(RT_table(:, 2), RT_table(:, 3));

