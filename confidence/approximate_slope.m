clear

cd ('C:\Users\Anna Poletaeva\Desktop\research project')

load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('confidence\')
correct_all_data = right_confidence(Data);

for i = 1:3
    drug_data = correct_all_data((correct_all_data.Drug_ID == i), :);
    [qnt, slp] = approx_conf_slope(drug_data);
    coef = polyfit(qnt, slp, 1)
    plot(qnt, slp, 'LineWidth', 3)
    hold on
end
hold off
title('Confidence slope')
ylabel('Confidence difference')
xlabel('Delta contrast')
legend({'drug 1', 'drug 2', 'drug 3'}, 'Location', 'southeast')