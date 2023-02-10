clear
cd ('C:\Users\Anna Poletaeva\Desktop\research project')

load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('react_times_correct_and_error\RT with delta contr\')

% drug = Data((Data.Drug_ID == 1), :);
% %[rt_corr_data, rt_err_data, quantile_data] = each_trial_to_quantiles_with_contrast(drug);
% plot_react_times_and_sem_quantiles(drug)
figure()
set(gcf, 'Position', [1 1 1200 400])
t = tiledlayout(1,3);
t.TileSpacing = 'compact';

for i = 1:3
    nexttile
    drug_data = Data((Data.Drug_ID == i), :);
    plot_react_times_and_sem_quantiles(drug_data)
    %title('Drug', num2str(i))
    ax = gca;
    if (i == 2)|| (i == 3)
        ax.YTickLabel = [];
    else
        ylabel('Reaction time, s', 'FontSize', 22)
    end
    ax.FontSize = 18;

end
xlabel(t, 'Delta contrast', 'FontSize', 20)

%legend('correct', 'error')