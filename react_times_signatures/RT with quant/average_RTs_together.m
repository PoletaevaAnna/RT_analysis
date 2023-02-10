clear
cd ('C:\Users\Anna Poletaeva\Desktop\research project')
close
load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('react_times_correct_and_error\RT with quant\')
figure(1)
quant = [1:4];
set(gcf, 'Position', [1 1 1200 600])
titles = ({'Lorazepam' 'Placebo' 'Memantine'});
colors =[    0    162   255;

     255/2    255/2   255/2;

    238 34 12]./255;

for i = 1:3
    drug_data = Data((Data.Drug_ID == i), :);
    [RT, RT_corr] = reaction_times_together(drug_data);
    sem = SEM_bars(RT);
    subplot(1, 2, 1)
    shadedErrorBar(quant, mean(RT, 1), sem, 'lineProps',{'Color', colors(i, :), 'LineWidth', 5})
    hold on
  %  plot_RT_vs_corr(drug_data, colors(i, :))
    subplot(1, 2, 2)
    sem_corr = SEM_bars(RT_corr);
    shadedErrorBar(quant, mean(RT_corr, 1), sem_corr, 'lineProps',{'Color', colors(i, :), 'LineWidth', 5})
    %ylim([0.33 0.5])
    %xlim([0.9 4.1])
end
for ii = 1:2
    subplot(1, 2, ii)
    xlabel('Quantiles (delta contrast)')
    ylim([0.33 0.5])
    xlim([0.9 4.1])
    xticks([1 2 3 4])
    yticks([0.35 0.4 0.45 0.5])
    ylabel('Reaction time, s')
    set(gca, 'FontSize', 18)
end
subplot(1, 2, 1)
title(['Average reaction time,' newline 'all trials'])
subplot(1, 2, 2)
title(['Average reaction time,' newline 'correct trials'])
legend({'Lorazepam', 'Placebo', 'Memantine'})






