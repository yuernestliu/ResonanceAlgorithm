function [ Optimal, D] = DijkstraArithmetic_Extend(Table, dim, ORIGI, DESTI )

[path, D]=Compute_Extend(Table, dim, ORIGI, DESTI); % Get all shortest paths (path) and all shortest cost (D) 

cur=[];
V=[];
[Optimal]=print_path( ORIGI, DESTI, cur,V , path );

