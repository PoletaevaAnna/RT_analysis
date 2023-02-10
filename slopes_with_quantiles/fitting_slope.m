function [lin_coeff, intercept] = fitting_slope(slope)
    quant = 1:4;
    for n = 1: height(slope)
%         plot(quant,slope(n, :))
%         hold on
        linear_coeff = polyfit(quant, slope(n, :), 1);
        lin_coeff(n) = linear_coeff(1);
        intercept(n) = linear_coeff(2);
    end
end