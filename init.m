%
%
%
%cd 'C:\Users\Asus\Downloads\_____\Blacked Raw'
%clear getIndex
i = 16;
raw = fileTrunc(sprintf('view-source_https___www.blackedraw.com_videos_page=%d&size=12.html',i));
links = crawlLinks(raw);
title = fetchTitle(raw);
id = fetchId(raw,length(title));
model = fetchModel(raw);
vidLink = tarLinksVid(links);
imgLink = tarLinksImg1080p(links);
imgLink3240p = tarLinksImg3240p(links);
for j = 1:length(id)
    index = getIndex();
    log(index) = struct('Index',index,'Id',id(j),'Title',title(j),'Model',model(j));
end

%save id.dat id -ascii -append;


