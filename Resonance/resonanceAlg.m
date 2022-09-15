function [ pathNode, pathTime ] = resonanceAlg(Map, ORIGI, DESTI)
map = Map;

NeedToSortMap = false;

TimeListSize = 100; % 100, pre-setting, time of shortest path
bookNTSizeY = 50; % 50, pre-setting, #nodes involed in shortest path
bookNTSizeX = 10; % 10, pre-setting, max(#links of a node)
pathNumSize = 10; % 10, pre-setting, #paths


% ====== begin ======
[f, mapSorted, book, maxNode, minTime] = Forward(map, ...
    ORIGI, DESTI, TimeListSize, NeedToSortMap);
b = Backward(map, maxNode, ORIGI, DESTI, minTime);

s = f .* b;
[pathNode, pathTime] = FindPaths(mapSorted, s, book, ...
    minTime, DESTI, bookNTSizeY, bookNTSizeX, pathNumSize);

% ====== display ======
% DispPaths(pathNode, pathTime);
end

