function DispPaths(pathNode, pathTime)
disp('-----------------')
for i = 1 : size(pathNode,1)
    lenpath = find(pathNode(i,:) == 0, 1) - 1;
    if isempty(lenpath)
        lenpath = length(pathNode(i,:));
    end
    strPath = '';
    for j = 1 : lenpath - 1
        strPath = [strPath, num2str(pathNode(i,j)), '(', ... 
            num2str(pathTime(i,j)), ')-->'];
    end
    strPath = [strPath, num2str(pathNode(i,lenpath)), '(', ...
            num2str(pathTime(i,lenpath)), ').'];
    disp(strPath)
end
disp('-----------------')