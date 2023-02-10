function [qnt_cntr, slp] = approx_conf_slope(data)
    [~, ~, qnt_cntr, ~, cnf_corr, cnf_err] = react_times_to_quantiles_with_sems_and_conf(data);
    slp = cnf_corr-cnf_err;
end