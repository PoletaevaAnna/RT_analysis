clear
close all
cd ('C:\Users\Anna Poletaeva\Desktop\research project')

load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('compare diff conf\')
correct_all_data = right_confidence(Data);
figure()
set(gcf, 'Position', [1 1 300 500])

[high_conf, low_conf] = each_trial_correctness_vs_conf(correct_all_data);
for n = 1: length(low_conf)
    scatter(1, low_conf(n), 100, 'filled', 'MarkerFaceAlpha', 0.5, 'MarkerFaceColor',[0 0.4470 0.7410])
    hold on
    scatter(2, high_conf(n), 100,  'filled', 'MarkerFaceAlpha', 0.5, 'MarkerFaceColor',[0 0.4470 0.7410])
    hold on
    line([1 2], [low_conf(n), high_conf(n)])
    hold on
end
scatter(1, mean(low_conf), 250, 'pentagram', 'filled', 'MarkerFaceColor', ...
    [0.8500 0.3250 0.0980], 'MarkerEdgeColor',[0.6350 0.0780 0.1840], 'MarkerFaceAlpha', 0.85)
hold on
scatter(2, mean(high_conf), 250, 'pentagram', 'filled', 'MarkerFaceColor', ...
    [0.8500 0.3250 0.0980],  'MarkerEdgeColor',[0.6350 0.0780 0.1840], 'MarkerFaceAlpha', 0.85)
hold on
line([1 2], [mean(low_conf), mean(high_conf)], 'LineStyle', '--', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 3)
conf_tog = [low_conf.',high_conf.'];
xlim([0.8 2.2])
xticks([1 2])
xticklabels({'low', 'high'})
ylim([0.4 1])
hold on 
generate_sigline(0.9, conf_tog, 0.05, [1 2], 0.35)
yticks([0.5 0.6 0.7 0.8 0.9])
%title(['Fraction of correct trials' newline 'for different confidence levels'])
ylabel('Fraction of correct trials')
set(gca, 'FontSize', 20)




