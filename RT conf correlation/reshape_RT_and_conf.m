function [RT, conf] = reshape_RT_and_conf(data)
    [RT_corr, RT_err] = RT_each_trial_to_quantiles(data);
    [cfd_corr, cfd_err] = conf_each_trial_to_quantiles(data);
    RT_together = [RT_corr; RT_err];
    conf_together = [cfd_corr; cfd_err];
    size = height(RT_together(:, 1)) * length(RT_together(1, :));
    RT = reshape(RT_together, [size, 1]);
    conf = reshape(conf_together, [size, 1]);
end