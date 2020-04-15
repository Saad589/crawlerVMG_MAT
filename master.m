%clear getIndex
i = 16;
raw = fileTrunc(sprintf('%d.html',i));
links = crawlLinks(raw);
title = fetchTitle(raw);
id = fetchId(raw,length(title));
model = fetchModel(raw);
vidLink = tarLinksVid(links);
imgLink = tarLinksImg1080p(links);
for j = 1:length(id)
    index = getIndex();
    log(index) = struct('Index',index,'Id',id(j),'Title',title(j),'Model',model(j));
end

%save id.dat id -ascii -append;


function out = tarLinksImg1080p(links)
out = [];
for i = 1:length(links)
    if ~isempty(strfind(links(i),'1920x1080.webp'))
        out = [out ; links(i)];
    end
end
end

function out = tarLinksVid(links)
out = [];
for i = 1:length(links)
    if ~isempty(strfind(links(i),'1080P'))
        out = [out ; links(i)];
    end
end
end

function outId = fetchId(page_i,j)
sig = '"newId":';
sig_len = length(sig);
index = strfind(page_i,sig);
outId = zeros(1,j);
for i = 1:j
    outId(i) = str2num(page_i((index(i)+sig_len):(index(i)+sig_len+6)));
    i = i+1;
end
end

function outTitle = fetchTitle(page_i)
outTitle = [];
outTitle = extractBetween(page_i,'"title":"','","modelsSpaced"');
end

function outModel = fetchModel(page_i)
outModel = [];
outModel = upper(strrep(extractBetween(page_i,'"modelsSpaced":"','","modelsSlugged"'),'&amp;','&'));
end

function out = fileTrunc(file)
temp = fileread(file);

scope_index_begins = strfind(temp,'window.__INITIAL_STATE__');
temp(1: scope_index_begins) = '';
% 
% Now delete some more
temp(1:22500) = '';
% 
 scope_index_ends = strfind(temp,'"featuredVideos":[],');
 temp(scope_index_ends:end) = '';
% 
 out = temp;
end
 
function outLinks = crawlLinks(page_i)
outLinks = prettify(extractBetween(page_i,'"https','"'));
end

function prettified = prettify(str)
str = strcat('https',str);
temp1 = strrep(str,'&amp;','&');
temp2 = strrep(temp1,'\u002F','/');
prettified = temp2;
end