clear
cd ('C:\Users\Anna Poletaeva\Desktop\research project')

load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('compare diff conf/')
dat = right_confidence(Data);
figure()
set(gcf, 'Position', [1 1 400 600])
plot_correctness_diff_conf(dat)
xticks([ 1 2 3 4])
xlabel('Quantiles (delta contrast)')
yticks([0.5 0.6 0.7 0.8 0.9 1])
ylabel('Fraction of correct trials')
legend({'low confidence', 'high confidence'}, 'location', 'southeast')
set(gca, 'FontSize', 18)
