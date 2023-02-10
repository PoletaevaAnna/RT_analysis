% Calculates standard error of mean for any input table that consists of
% any number of columns.
% In each column calculated the STD and divides it by the square root of
% number of values in this column. The output is a (1 x number of columns) 
% table of SEMs, the former sequence of columns is perceived.
function b = SEM_bars(data)
    b = [];
    for columns = 1:length(data(1, :))
        sem = std(data(:, columns)) / sqrt(height(data(:, columns)));
        b(columns) = sem;
    end
end