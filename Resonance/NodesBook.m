function book = NodesBook(map1st, maxNode)
book = zeros(maxNode, 2); % gives which node links to which

nodeID = 1;
i = 1;
book1stBlank = true;

while nodeID <= maxNode
    while i <= length(map1st)
        
        if map1st(i) == nodeID
            if book1stBlank
                book(nodeID, 1) = i;
                book1stBlank = false;
            end
            i = i + 1;
        else % map1st(i) > nodeID
            if book1stBlank
                book(nodeID, 1) = 0;
                book(nodeID, 2) = -1;
            else
                book(nodeID, 2) = i-1;
                book1stBlank = true;
            end
            nodeID = nodeID + 1;
            break
        end
        
    end
    
    if i == length(map1st) + 1
        book(nodeID, 2) = length(map1st);
        break
    end
end

book(nodeID + 1 : end, 2) = -1;