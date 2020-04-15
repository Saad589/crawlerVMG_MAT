function out = tarLinksImg3240p(links)
%
%
%
out = [];
for i = 1:length(links)
    if ~isempty(strfind(links(i),'5760x3240.webp'))
        out = [out ; links(i)];
    end
end
end