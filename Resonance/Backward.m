function b = Backward(map0, maxNode, ORIGI, DESTI, minTime)
map = map0;
map(:, 1) = map0(:, 2);
map(:, 2) = map0(:, 1);
map = sortrows(map, 1);

book = NodesBook(map(:, 1), maxNode);

nodeTQuickest = zeros(1, maxNode) - Inf;
nodeTQuickest(DESTI) = minTime;

TimeList = zeros(1, minTime);
t = minTime;
TimeList(t) = 1;

b = zeros(maxNode, minTime);

% send signal from DESTI
b(DESTI, t) = 1;
for idx = book(DESTI, 1) : book(DESTI, 2)
    tToCheck = t - map(idx, 3);
    if tToCheck > 0
        b( map(idx, 2), tToCheck ) = 1;
        TimeList( tToCheck ) = 1;
        nodeTQuickest( map(idx, 2) ) = tToCheck;
    end
end

% looping from t = minTime - 1
while true
    t = t - 1;
    if TimeList(t) == 1
        nodeToDo = find(b(:, t))';
        if any(nodeToDo == ORIGI)
            break
        end
    
        for node = nodeToDo
            for idx = book(node, 1) : book(node, 2)
                nodeGet = map(idx, 2);
                tToCheck = t - map(idx, 3);
                if nodeTQuickest(nodeGet) < tToCheck
                % if still unvisited, then send signal
                    if tToCheck > 0
                        b( nodeGet, tToCheck ) = 1;
                        TimeList( tToCheck ) = 1;
                        if nodeTQuickest(nodeGet) ~= -Inf
                            b( nodeGet, nodeTQuickest(nodeGet)) = 0;
                        end
                        nodeTQuickest( nodeGet ) = tToCheck;
                    end
                end
            end
        end
        
    end
end