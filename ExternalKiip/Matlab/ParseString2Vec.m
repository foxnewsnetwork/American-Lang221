function out_vec = ParseString2Vec( in_str )
% Assumes we're using the comma delimiter

out_vec = [];
new_vec = [];
str_vec = in_str + 0;

for k = 1:length(in_str)
    if(str_vec(k) == ',')
        new_vec = [];
        out_vec = [out_vec ; new_vec];
    elseif(str_vec(k) == '"')
        ignore_flag = 1;
    else
        new_vec = [new_vec str_vec(k)];
    end
end
out_vec = [out_vec; new_vec]