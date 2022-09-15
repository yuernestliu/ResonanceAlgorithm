function [f, map, book, maxNode, minTime] = Forward(map, ...
    ORIGI, DESTI, TimeListSize, NeedToSortMap)
if NeedToSortMap
    map = sortrows(map, 1);
end
maxNode = max(max(map(:, 1:2)));
book = NodesBook(map(:, 1), maxNode);

nodeTQuickest = zeros(1, maxNode) + Inf;
nodeTQuickest(ORIGI) = 1;

TimeList = zeros(1, TimeListSize);
t = 1;
TimeList(t) = 1;

f = zeros(maxNode, TimeListSize);

% send signal from ORIGI 
f(ORIGI, t) = 1;
for id = book(ORIGI, 1) : book(ORIGI, 2)
    tToCheck = t + map(id, 3);
    f( map(id, 2), tToCheck ) = 1;
    TimeList( tToCheck ) = 1;
    nodeTQuickest( map(id, 2) ) = tToCheck;
end

% looping from t = 2
LenTimeList = length(TimeList);
while true
    t = t + 1;
    if t > LenTimeList
        TimeList(end + TimeListSize) = 0;
        LenTimeList = length(TimeList);
    end
    if TimeList(t) == 1
        nodeToDo = find(f(:, t))';
        if any(nodeToDo == DESTI)
            break
        end
    
        for node = nodeToDo
            for idx = book(node, 1) : book(node, 2)
                nodeGet = map(idx, 2);
                tToCheck = t + map(idx, 3);
                if nodeTQuickest(nodeGet) > tToCheck
                % if still unvisited, then send signal
                    f( nodeGet, tToCheck ) = 1;
                    if nodeTQuickest(nodeGet) ~= Inf
                        f( nodeGet, nodeTQuickest(nodeGet)) = 0;
                    end
                    TimeList( tToCheck ) = 1;
                    nodeTQuickest( nodeGet ) = tToCheck;
                end
            end
        end
        
    end
end

minTime = t;
f(:, minTime + 1 : end) = [];