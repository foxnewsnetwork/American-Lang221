function out_vec = ParseString2Vec( in_str , delimiter )
% Assumes we're using the comma delimiter

if(in_str(1) == delimiter)
    in_str(1) = [];
end
if(in_str(end) == delimiter)
    in_str(end) = [];
end

out_vec = {in_str};
quote_flag = false;
for k = 1:length(in_str)
    if( in_str(k) == '"' )
        if( quote_flag == true)
            quote_flag = false;
        else
            quote_flag = true;
        end
        continue;
    end
 
    if( in_str(k) == delimiter && quote_flag == false)
        myWord = {in_str(1:(k-1))};
        reStuff = in_str((k+1):end);
        out_vec = [myWord , ParseString2Vec(reStuff, delimiter)];
        break;
    end
end
