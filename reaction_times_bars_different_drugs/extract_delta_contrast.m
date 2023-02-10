% Finds the real delta contrast by taking mean of all contrasts sent to the
% left and contrasts sent to the right. Since the side is not inportant for
% further analysis, an absolute value of difference is taken. Delta correct
% and delta error are used to store delta values for correct trials and
% error trials separately (real_delta has all the trials together).
function  [real_delta, real_delta_correct, real_delta_error]= extract_delta_contrast(data)
    real_delta = abs(mean(data.contrast_left, 2) - mean(data.contrast_right, 2));
    real_delta_correct = real_delta(data.correct == 1);
    real_delta_error = real_delta(data.correct == 0);
end