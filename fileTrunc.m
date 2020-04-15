function out = fileTrunc(file)
%
%
%
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
