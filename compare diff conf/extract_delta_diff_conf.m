% Finds the real delta contrast by taking mean of all contrasts sent to the
% left and contrasts sent to the right. Since the side is not inportant for
% further analysis, an absolute value of difference is taken. Delta correct
% and delta error are used to store delta values for correct trials and
% error trials separately (real_delta has all the trials together).
function  [real_delta, real_delta_low, real_delta_high]= extract_delta_diff_conf(data)
    real_delta = abs(mean(data.contrast_left, 2) - mean(data.contrast_right, 2));
    real_delta_low= real_delta(data.confidence == 1);
    real_delta_high = real_delta(data.confidence == 2);
end