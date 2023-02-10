% This function addresses a subject by its number in the overall table. It extracts all
% the information for a subject that from that table into a variable
% subj_data.
% It will be further used in a for cycle and some of the trials
% are missing, if/else construction is added to deal with the situation of
% a missing subject.

function subj_data = extract_subj_data(data, subj_numb)
    if isempty((data.Subject_ID == subj_numb)) == 1
        subj_data = [];
    else
        subj_data = data((data.Subject_ID == subj_numb), :);
    end
end
