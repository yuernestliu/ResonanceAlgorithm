function [pathNode, pathTime] = FindPaths(map, s, book, ...
    minTime, DESTI, bookNTSizeY, bookNTSizeX, pathNumSize)
% make sure map is sorted

bookNode = zeros(bookNTSizeY, bookNTSizeX);
% 1st column: starting node
% 2nd column: number of ending nodes + 2, ie, #non-zeros for this row
% >= 3rd column: ending nodes
bookTime = zeros(size(bookNode));
TimeList = sum(s);
icount = 0;
jcountMAX = 0;
for t = 1 : minTime - 1
    if TimeList(t) > 0
        for node2check = find(s(:,t))'
            icount = icount + 1;
            if icount > size(bookNode,1)
                bookNode(end + bookNTSizeY, 1) = 0;
                bookTime(end + bookNTSizeY, 1) = 0;
            end
            bookNode(icount, 1) = node2check;
            bookTime(icount, 1) = t;
            
            jcount = 2;
            for idx = book(node2check, 1) : book(node2check, 2)
                nodeGet = map(idx, 2);
                tGet = t + map(idx, 3);
                if tGet <= minTime && s(nodeGet, tGet) == 1
                    jcount = jcount + 1;
                    if jcount > size(bookNode,2)
                        bookNode(1, end + bookNTSizeX) = 0;
                        bookTime(1, end + bookNTSizeX) = 0;
                    end
                    bookNode(icount, jcount) = nodeGet;
                    bookTime(icount, jcount) = tGet;
                end
            end
            bookNode(icount, 2) = jcount;
            bookTime(icount, 2) = jcount;
            if jcountMAX < jcount
                jcountMAX = jcount;
            end
            
        end
    end
end
bookNode(icount+1 : end, :) = [];
bookTime(icount+1 : end, :) = [];
bookNode(:, jcountMAX + 1 : end) = [];
bookTime(:, jcountMAX + 1 : end) = [];
% Till now, bookNode & bookTime are all we need
% ========================================

pathNode = zeros(pathNumSize, bookNTSizeY);
pathTime = zeros(size(pathNode));
pathNodeY = pathNumSize;
pathNodeX = bookNTSizeY;

LenSeq = bookNTSizeY;
nodeSeq = zeros(1, bookNTSizeY);
timeSeq = zeros(1, bookNTSizeY);
branchNow = zeros(1, bookNTSizeY); % the current branch we are in
branchMAX = zeros(1, bookNTSizeY); % how many branches this node has

ithPath = 0;
bookNode1st = bookNode(:,1);
xpath = 1;
idx = 1;
node = bookNode(idx,1); % ORIGI node
nodeSeq(xpath) = node;
timeSeq(xpath) = bookTime(idx,1);
branchNow(xpath) = 3; % default
branchMAX(xpath) = bookNode(idx,2);
while xpath > 0
    if branchNow(xpath) <= branchMAX(xpath)
        node = bookNode(idx, branchNow(xpath));
        branchNow(xpath) = branchNow(xpath) + 1;
        if node == DESTI
            if xpath + 1 > LenSeq
                nodeSeq(end + bookNTSizeY) = 0;
                timeSeq(end + bookNTSizeY) = 0;
                branchNow(end + bookNTSizeY) = 0;
                branchMAX(end + bookNTSizeY) = 0;
                LenSeq = length(nodeSeq);
            end
            nodeSeq(xpath+1) = DESTI;
            timeSeq(xpath+1) = minTime;
            
            if LenSeq > pathNodeX
                pathNode(1,LenSeq) = 0;
                pathTime(1,LenSeq) = 0;
                pathNodeX = LenSeq;
            end
            ithPath = ithPath + 1;
            if ithPath > pathNodeY
                pathNode(end + pathNumSize, 1) = 0;
                pathTime(end + pathNumSize, 1) = 0;
                pathNodeY = size(pathNode,1);
            end
            pathNode(ithPath,1:LenSeq) = nodeSeq;
            pathTime(ithPath,1:LenSeq) = timeSeq;
            nodeSeq(xpath+1) = 0;
            timeSeq(xpath+1) = 0;
            while xpath > 0 && branchNow(xpath) > branchMAX(xpath)
                nodeSeq(xpath) = 0;
                timeSeq(xpath) = 0;
                xpath = xpath - 1;
            end
            if xpath > 0
                idx = (bookNode1st == nodeSeq(xpath));
            end
        else
            xpath = xpath + 1;
            if xpath > LenSeq
                nodeSeq(end + bookNTSizeY) = 0;
                timeSeq(end + bookNTSizeY) = 0;
                branchNow(end + bookNTSizeY) = 0;
                branchMAX(end + bookNTSizeY) = 0;
                LenSeq = length(nodeSeq);
            end
            idx = (bookNode1st == node);
            
            nodeSeq(xpath) = node;
            timeSeq(xpath) = bookTime(idx,1);
            branchNow(xpath) = 3;
            branchMAX(xpath) = bookNode(idx,2);
        end
        
    end
end

% clean output
pathNode(ithPath + 1 : end, :) = [];
pathTime(ithPath + 1 : end, :) = [];
if size(pathNode,1) == 1
    temp = find(pathNode == 0, 1);
else
    temp = find(sum(pathNode) == 0, 1);
end
pathNode(:, temp : end) = [];
pathTime(:, temp : end) = [];
pathTime = pathTime - 1;