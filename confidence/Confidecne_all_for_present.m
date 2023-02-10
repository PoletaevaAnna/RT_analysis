clear
close all
cd ('C:\Users\Anna Poletaeva\Desktop\research project')

load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('confidence\')
correct_all_data = right_confidence(Data);
figure()
set(gcf, 'Position', [1 1 400 500])
empty_counter = 0;
for ii = 1:25
    subj = extract_subj_data(correct_all_data, ii);
    if isempty(subj)
        empty_counter = empty_counter + 1;
    continue
    else
        ind = ii - empty_counter;
        [a_all, a_corr, a_err] = general_percent_high_conf(subj);
        all(ind, :) = a_all;
        corr(ind, :) = a_corr;
        err(ind, :) = a_err;
    end
end
together = [all,corr,err];
[h, p] = signrank(corr, err);
vals = mean(together, 1);
sems = SEM_bars(together);
bars = categorical({'all', 'correct', 'error'});
b1 = bar(1, vals(1), 'FaceColor', 'flat', 'CData', [0 0.4470 0.7410]);
hold on
b2 = bar(2, vals(2), 'FaceColor', 'flat', 'CData', [0.4660 0.6740 0.1880]);
hold on
b3 = bar(3, vals(3), 'FaceColor', 'flat', 'CData', [0.6350 0.0780 0.1840]);

hold on
scatter(1, together(:, 1), 60, 'MarkerFaceColor', 'k', 'MarkerFaceAlpha', 0.5)
hold on
scatter(2, together(:, 2), 60, 'MarkerFaceColor', 'k', 'MarkerFaceAlpha', 0.5)
hold on
scatter(3, together(:, 3), 60, 'MarkerFaceColor', 'k', 'MarkerFaceAlpha', 0.5)
hold on

for dat = 1:3
    errorbar(dat, vals(dat), sems(dat), 'Color', 'k', ...
        'CapSize', 10, 'LineWidth', 3, 'LineStyle', 'none')
end

set(gca, 'FontSize', 17)
xticks([1 2 3])
xticklabels({'all', 'correct', 'error'})
xlim([0.3 3.7])

ylabel('Fraction of high confidence trials')

title('Confidence')



