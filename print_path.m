function [ V ] = print_path( ORIGI, ik, cur, V , path )

% cur has been defined as empty externally, for the recursion here
% Initial ik is DESTI
% V records all the shortest paths, one-dimensional, with 0 as the separator
cur=[ik cur];
if ik==ORIGI % Termination trigger
    V=[V 0 cur];
    return;
end

for i=1:length(path(:,ik))
    if path(i,ik)~=0
        V=print_path( ORIGI, path(i,ik) , cur, V , path );
    end
end

end

