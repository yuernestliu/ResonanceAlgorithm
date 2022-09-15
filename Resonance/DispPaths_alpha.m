function DispPaths_alpha(pathNode, pathTime)

% digit2alpha = {'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S'};
digit2alpha = {'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'J' 'K' 'L' 'M' 'N' 'P' 'Q' 'R' 'S'};
disp('-----------------')
for i = 1 : size(pathNode,1)
    lenpath = find(pathNode(i,:) == 0, 1) - 1;
    if isempty(lenpath)
        lenpath = length(pathNode(i,:));
    end
    strPath = '';
    for j = 1 : lenpath - 1
        strPath = [strPath, digit2alpha{pathNode(i,j)}, '(', ... 
            num2str(pathTime(i,j)), ')-->'];
    end
    strPath = [strPath, digit2alpha{pathNode(i,lenpath)}, '(', ...
            num2str(pathTime(i,lenpath)), ').'];
    disp(strPath)
end
disp('-----------------')