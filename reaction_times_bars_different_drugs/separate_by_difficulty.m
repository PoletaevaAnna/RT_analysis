function [high_diff, low_diff] = separate_by_difficulty(data)
    [real_delta, ~, ~] = extract_delta_contrast(data);
    separator = median(real_delta);
    high_diff = data((real_delta < separator), :);
    low_diff = data((real_delta > separator), :);
end