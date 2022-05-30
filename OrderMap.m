function m=OrderMap(Map, dim)

mm=zeros(dim);
for i=1:dim
    for j=1:dim
        if(i~=j)
            mm(i,j)=inf;
        end
    end
end % Assign '∞' to all outside the diagonal, that is, tentatively all nodes are not reachable to each other. 
% A diagonal of 0 means that the reachable distance from the node to itself is 0
for i=1:length(Map)
    mm(Map(i,1),Map(i,2))=Map(i,3);
end % Convert n*3 matrix to n*n square matrix. 
% The abscissa represents the starting point of the vector, the ordinate represents the end of the vector, and the value represents the modulus of the vector.
   
m=mm;