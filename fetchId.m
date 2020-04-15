function outId = fetchId(page_i,j)
%
%
%
sig = '"newId":';
sig_len = length(sig);
index = strfind(page_i,sig);
outId = zeros(1,j);
for i = 1:j
    outId(i) = str2num(page_i((index(i)+sig_len):(index(i)+sig_len+6)));
    i = i+1;
end
end