clear
cd ('C:\Users\Anna Poletaeva\Desktop\research project')

load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('react_times_correct_and_error\RT with quant\')
figure()
set(gcf, 'Position', [1 1 1200 400])
t = tiledlayout(1,3);
t.TileSpacing = 'compact';
titles = ({'Lorazepam' 'Placebo' 'Memantine'});

for i = 1:3
    nexttile
    drug_data = Data((Data.Drug_ID == i), :);
    plot_react_times_and_sem_quantiles(drug_data)
    title(titles(i), 'FontSize', 24)
    ax = gca;
    if (i == 2)|| (i == 3)
        
        ax.YTickLabel = [];
        ax.FontSize = 18;
    else
        ylabel('Reaction time, s', 'FontSize', 22)
    end
    
    ax.FontSize = 18;
end

xlabel(t, 'Quantiles (delta contrast)', 'FontSize', 20)


legend({'correct', 'error'}, 'FontSize', 24, 'Location', 'bestoutside')