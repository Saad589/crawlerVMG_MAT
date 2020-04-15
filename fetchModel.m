function outModel = fetchModel(page_i)
%
%
%
outModel = [];
outModel = upper(strrep(extractBetween(page_i,'"modelsSpaced":"','","modelsSlugged"'),'&amp;','&'));
end