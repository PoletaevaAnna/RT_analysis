% The funciton plots the lines in between drugs to give a visual
% representation of signrank test. The combinations are defalut and cover
% all possible pairs. h_p_vals are resluts of the test. Initial hight of
% the line and step size (how much is one line higher than the following
% one) are set manually because they depend on scale of the plot. Location
% of the text is also defined using step.

function generate_sigline(init_sigline_height, drug_all, step, combinations, text_loc)
    h_p_vals = rank_test_3_drugs(drug_all, combinations);
    for g = 1:size(combinations, 1)
        sigline_location = combinations(g, :);
        y = init_sigline_height + g * step;
        line(sigline_location, [y, y], 'LineWidth', 1, 'Color', 'k')
        hold on 
        for c = 1:2
            crd = sigline_location(c);
            line([crd, crd], [y, y - step/3], 'LineWidth', 1, 'Color', 'k')
            hold on
        end
        p = h_p_vals(g, 1);
        txt = ['p = ' num2str(round(p, 4))];
        text(mean(sigline_location) - text_loc, y + step/2, txt, 'FontSize',17)
        hold on
    end


    