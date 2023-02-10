clear
close all
cd ('C:\Users\Anna Poletaeva\Desktop\research project')

load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('RT conf correlation\')
correct_all_data = right_confidence(Data);

[RT_corr, RT_err] = RT_each_trial_to_quantiles(correct_all_data);
[cfd_corr, cfd_err] = conf_each_trial_to_quantiles(correct_all_data);
RT_all = [RT_corr, RT_err];
cfd_all = [cfd_corr, cfd_err];
figure(1)
set(gcf, 'Position', [1 1 800 800])
t = tiledlayout(4, 5);
for i = 1:20
    nexttile
    subj_RT = RT_all(i, :);
    % find z-scores for each subject to normalise
    z_subj_RT = zscore(subj_RT);
    subj_cfd = cfd_all(i, :);
    z_subj_cfd = zscore(subj_cfd);
    scatter(z_subj_cfd, z_subj_RT, 'filled', 'MarkerFaceAlpha', 0.7)
    hold on
    
    % correlation between z-scored RT and confidence is the same as for not
    % z-scores
    corr = corrcoef(z_subj_cfd, z_subj_RT);
    all_coef(i) = corr(1, 2);
    % find linear coefficients to plto the line on top of the graph and
    % demonstrate teh correlation
    lin_coef = polyfit(z_subj_cfd, z_subj_RT, 1);
    line([-3, 3], [((-3)*lin_coef(1) + lin_coef(2)), ((3)*lin_coef(1) + lin_coef(2))], ...
        'Color', 'red', 'LineStyle', '--', 'LineWidth', 1.5)
    text(-0.21, 1.8, ['r = ' num2str(round(corr(1, 2), 2))], 'Fontsize', 11)
    all_z_RT(i, :) = z_subj_RT;
    all_z_conf(i, :) = z_subj_cfd;
    xlim([-2.5 2.5])
    ylim([-2.5 2.5])
    
end
xlabel(t, 'confidence (z-scored)')
ylabel(t, 'reaction time (z-scored)')
title(t, ['Correlation between reaction time' newline 'and confidence for each subject'])

allRT = reshape(all_z_RT, 160, 1);
allcfd = reshape(all_z_conf, 160, 1);

figure(2)
set(gcf, 'Position', [1 1 500 500])
scatter(allcfd, allRT, 55, 'filled', 'MarkerFaceAlpha', 0.7)
corr_all = corrcoef(allcfd, allRT);
lin_coef = polyfit(allcfd, allRT, 1);
line([-3, 3], [((-3)*lin_coef(1) + lin_coef(2)), ((3)*lin_coef(1) + lin_coef(2))], ...
    'Color', 'red', 'LineStyle', '--', 'LineWidth', 2.5)
text(1, 1.8, ['r = ' num2str(round(corr_all(1, 2), 2))], 'Fontsize', 20)
xlim([-2.5 2.5])
ylim([-2.5 2.5])
set(gca, 'Fontsize', 18)
xlabel('Fraction of high confidence (z-score)')
ylabel('Reaction time (z-score)')
title(['Correlation between confidence' newline 'and reaction time'])

figure(3)
set(gcf, 'Position', [1 1 600 300])
scatter(all_coef, 1, 200, 'filled', 'MarkerFaceAlpha', 0.5)
hold on
mn_x = mean(all_coef);
line([mn_x, mn_x], [0.95 1.05],'LineWidth', 4, 'Color', 'k')
text(mn_x, 1.07, num2str(round(mn_x, 3)), 'FontSize', 16)
%plot_mean_line(all_coef, 1)
ylim([0.9 1.1])
xticks([-1 -0.75 -0.5 -0.25 0])
set(gca, 'FontSize', 16)
xlim([-1.1 0.07])
yticks([1])
yticklabels([])
xlabel('Pearson correlation coefficient', 'FontSize', 15)
title(['Coefficients of correlation' newline 'between fraction of high confidence' newline ...
    'and average reaction time'], 'FontSize', 15)
xline(0, '--', 'LineWidth', 2)


% labels; plot the correaltion line; compare correlation coeffs