clear
close all
cd ('C:\Users\Anna Poletaeva\Desktop\research project')

load('Data_for_anna.mat');
open('Data_for_anna.mat');
cd('RT conf correlation\')
correct_all_data = right_confidence(Data);

[RT, conf] = reshape_RT_and_conf(correct_all_data);
scatter(conf, RT)
corr = corrcoef(conf, RT);

xlabel('fraction of high confidence')
ylabel('reaction time, s')
