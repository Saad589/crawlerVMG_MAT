function out = getIndex()
persistent index;
if isempty(index);
    index = 0;
end
index = index + 1;
out = index;
end