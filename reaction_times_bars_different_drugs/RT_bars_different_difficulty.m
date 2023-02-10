close all
clear
cd ('C:\Users\Anna Poletaeva\Desktop\research project')

load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('reaction_times_bars_different_drugs\')
colors =[    0    162   255;

     255/2    255/2   255/2;

    238 34 12]./255;
figure(1)
set(gcf, 'Position', [1 1 1300 500])

for i = 1:3
    drug_data = Data((Data.Drug_ID == i), :);
    [high, low] = RT_mult_subj_difficulty(drug_data);
    % Store the RT values for different difficulties to further run a rank
    % test on them
    high_all(:, i) = high;
    low_all(:, i) = low;
    high_low_together = [high_all, low_all];
    sem_high = SEM_bars(high);
    sem_low = SEM_bars(low);
    subplot(1, 2, 1)
    bar(i, mean(high), 'FaceColor', colors(i, :))
    hold on
    scatter(i, high, 80,'filled', 'k', 'MarkerFaceAlpha', 0.4)
    hold on
    errorbar(i, mean(high), sem_high, 'LineStyle', 'none', 'LineWidth',3, 'CapSize', 10, 'Color', 'k')
    subplot(1, 2, 2)
    bar(i, mean(low), 'FaceColor', colors(i, :))
    hold on
    scatter(i, low, 80, 'filled', 'k', 'MarkerFaceAlpha', 0.4)
    hold on
    errorbar(i, mean(low), sem_low, 'LineStyle', 'none', 'LineWidth',3, 'CapSize', 10, 'Color', 'k')
end
xticks([1 2 3])
xticklabels({'Lorazepam', 'Placebo', 'Memantine'})
ylim([0 1.15])
subplot(1, 2, 1)
xticks([1 2 3])
xticklabels({'Lorazepam', 'Placebo', 'Memantine'})
ylim([0 1.15])

combinations = [1 2; 2 3; 1 3];
init_sigline_height = 0.77;
step = 0.085;
%Compare trials with high difficulty

subplot(1, 2, 1)
generate_sigline(init_sigline_height+0.02, high_all, step, combinations, 0.5)
title(['Average reaction time' newline 'for high difficulty trials'])
ylabel('Reaction time, s')
set(gca, 'FontSize', 15)
%Compare triasl with low difficulty
subplot(1, 2, 2)
generate_sigline(init_sigline_height, low_all, step, combinations, 0.5)
title(['Average reaction time' newline 'for low difficulty trials'])
set(gca, 'FontSize', 15)
close
figure(2)
set(gcf, 'Position', [1 1 600 600])
for ii = 1:6
    bar(ii, mean(high_low_together(:, ii)), 'FaceColor', colors((fix((ii-1) / 2)+1), :))
    hold on
    scatter(ii, high_low_together(:, ii), 'filled', 'MarkerFaceColor','k', 'MarkerFaceAlpha',0.5)
    hold on
    if rem(ii, 2) == 1
        text(ii - 0.3, 0.03, 'high', 'Fontsize', 14, 'FontWeight','bold')
    else
        text(ii - 0.3, 0.03, 'low', 'FontSize', 14, 'FontWeight','bold')
    end
end
comb = [1 2; 3 4; 5 6];
generate_sigline(init_sigline_height+0.03, high_low_together, step - 0.05, comb, 0.6)
set(gca, 'FontSize', 15)
xticks([1.5 3.5 5.5])
xticklabels({'Lorazepam', 'Placebo', 'Memantine'})
ylabel('Reaction time, s')
title(['Average reaction time for' newline 'trials with different difficulty'])
ylim([0 1])
close all

[high, low] = RT_mult_subj_difficulty(Data);
tog = [high, low];
sem_all = SEM_bars(tog);

for n = 1:2
    bar(n, mean(tog(:, n)))
    hold on
    scatter(n, tog(:, n), 60,'MarkerFaceColor', 'k', 'MarkerFaceAlpha',0.5)
    hold on
    errorbar(n, mean(tog(:, n)), sem_all(n), 'LineStyle', 'none', 'LineWidth',3, 'CapSize', 10, 'Color', 'k')
    hold on
end
[p, h] = signrank(tog(:, 1), tog(:, 2));
com = [1 2];
line(com, [0.85, 0.85], 'LineWidth', 2, 'Color', 'k')
hold on 
for c = 1:2
    crd = com(c);
    line([crd, crd], [0.85, 0.85 - 0.05], 'LineWidth', 2, 'Color', 'k')
    hold on
end
txt = ['p = ' num2str(round(p, 4))];
text(mean(com) - 0.35, 0.85 + 0.04, txt, 'FontSize',15)
xticks([1 2])
xticklabels({'high difficulty', 'low difficulty'})
ylim([0 0.95])
ylabel('Reaction time, s')
set(gca, 'FontSize', 15)
title(['Average reaction time' newline 'for trials of different difficulty'])
xlim([0.3 2.7])
%generate_sigline(init_sigline_height+0.03, tog, 0, combin, 0.4)

% for ii = 1:3
%     bar(ii-0.2, mean(high_all(:, ii)))
%     hold on
%     bar(ii+0.2, mean(low_all(:, ii)))
%     hold on
% end
% set(gca,'xticklabel', {'Lorazepam', 'Placebo', 'Memantine'})
% ylabel('Reaction time, s')
% title('Average reaction time')
% ylim([0 1.1])
% set(gca, 'FontSize', 17)
% xlim([0.3 3.8])