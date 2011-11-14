function num_out = conv2num( str_in )
% Converts a '"234,314,123"' to 234314123

str = [];
if(strcmp(str_in,'N/A'))
    num_out = 0;
    return
end
for k = 1:length(str_in)
    if( str_in(k) ~= '"' && str_in(k) ~= ',')
        str = [str str_in(k)];
    end
end

num_out = eval(str);