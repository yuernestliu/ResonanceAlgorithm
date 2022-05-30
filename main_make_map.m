clear;

probability = 0.15;  % Connectivity probability
Map = [];

for i = 10:10:300
  for j = 1:50
    Map = [];
    for k1 = 1:i  % Generate a Map    
      for k2 = [1:k1-1 k1+1:i]
        if unifrnd(0,1) > probability
          Map = [Map ; [k1 k2 randi(5)]];
        endif
      endfor
    endfor

    disp('Map:');
    disp(Map);
    
    %% Verify connectivity %%
    dim = i;
    ORIGI=unidrnd(dim); %路径起点
    DESTI=unidrnd(dim); %路径终点
    tic
    [Optimal, D]=DijkstraArithmetic(Map, dim, ORIGI, DESTI );
    tDJ=toc;
    disp(['Dijkstra:' num2str(tDJ)]);
    Display(Optimal, D);
    %% Save %%
    save(['Maps/A' num2str(i) '_' num2str(j) '.mat'] , 'Map');
  endfor
endfor

