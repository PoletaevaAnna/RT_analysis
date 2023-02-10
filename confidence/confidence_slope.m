function slope = confidence_slope(data)
    [conf_corr_data, conf_err_data] = each_trial_conf_to_quantiles(data);
    slope = conf_corr_data - conf_err_data;
end