function out = tarLinksImg1080p(links)
%
%
%
out = [];
for i = 1:length(links)
    if ~isempty(strfind(links(i),'1920x1080.webp'))
        out = [out ; links(i)];
    end
end
end