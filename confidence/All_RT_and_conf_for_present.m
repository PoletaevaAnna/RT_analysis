clear
close all
cd ('C:\Users\Anna Poletaeva\Desktop\research project')

load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('confidence\')
correct_all_data = right_confidence(Data);
figure()
set(gcf, 'Position', [1 1 800 400])


subplot(1, 2, 1)
plot_react_times_and_sem_quantiles(correct_all_data, 0)
ylabel('Reaction time, s')
title('Reaction time')
xlabel('Quantiles (delta contrast)')
[~, ~, ~, ~, cnf_corr, cnf_err] = react_times_to_quantiles_with_sems_and_conf(correct_all_data);
xlim([0.8 4.2])
xticks([1 2 3 4])
set(gca, 'FontSize', 14)
subplot(1, 2, 2)
plot_confidence_with_sems(correct_all_data, 0)
ylabel('Fraction of high confidence trials')
%ylim([0 1])

xlim([0.8 4.2])
xticks([1 2 3 4])
xlabel('Quantiles (delta contrast)')
title('Confidence')
set(gca, 'FontSize', 14)

legend({'correct', 'error'}, 'Location', 'northeast')


