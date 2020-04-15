function out = tarLinksVid(links)
%
%
%
out = [];
for i = 1:length(links)
    if ~isempty(strfind(links(i),'1080P'))
        out = [out ; links(i)];
    end
end
end