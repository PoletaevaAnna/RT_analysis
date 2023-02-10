% The idea is to invert confidence labels for trials where the chosen side is 1.
% 1 2 -> 2 1. Addressing by indeces turned out to be both, time-costly and
% complicated to reasile. Therefore, a transformation is done this way:
% 1 * (-1); 2* (-1) = -1; -2
% -1 + 3; -2 + 3 = 2; 1
% First all correct data separated from incorrect and they are stored in
% different tables. 
% Then, confidence in the table with the side == 1 is transformed by the
% aforementioned operations and new confidence replaces the former
% incorrect confidence.

function new_data = right_confidence(data)
    all_good = data((data.response == (-1)), :);
    incorr_conf = data((data.response == 1), :);
    new_confd = incorr_conf.confidence * (-1) + 3;
    incorr_conf.confidence = new_confd;
    new_data = [all_good; incorr_conf];
end