function outLinks = crawlLinks(page_i)
%
%
%
outLinks = prettify(extractBetween(page_i,'"https','"'));
end

function prettified = prettify(str)
str = strcat('https',str);
temp1 = strrep(str,'&amp;','&');
temp2 = strrep(temp1,'\u002F','/');
prettified = temp2;
end