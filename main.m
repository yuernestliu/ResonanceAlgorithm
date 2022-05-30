clear;
addpath(genpath('Dijkstra_Extend'));
addpath(genpath('Dijkstra'));
addpath(genpath('Resonance'));

N=[10:10:300];
%N=10;
timeRA=zeros(length(N),50);
timeDJ=zeros(length(N),50);
timeDJo=zeros(length(N),50);
avgPaths=zeros(length(N),1);
num_map = 50;

for iiSTA=N % 30 scales
    sumPaths=0; % Total num of paths
    for iSTA=1:num_map % 50 random maps under the same scale
        nameMap=['newMaps2/Map' num2str(iiSTA) 'B' num2str(iSTA) '.mat'];
        load(nameMap); % Map
        dim=iiSTA; % num of nodes
        sumPaths=sumPaths+length(Map);
        
        ORIGI=unidrnd(dim); % Start node
        DESTI=unidrnd(dim); % End node
%         ORIGI=9; % Start node
%         DESTI=10; % End node
        while DESTI==ORIGI
            DESTI=unidrnd(dim); % If the Start node equals to the End node, re-random
        end

        
        disp('************atimeRA*************************');
        disp(nameMap);
        disp(['dim=' num2str(dim) ',' num2str(ORIGI) '--' num2str(DESTI)]);
     
        tic
        [ pathNode, pathTime ]=resonanceAlg(Map, ORIGI, DESTI);
        tRA=toc;
        
        tic
        [Optimal, D]=DijkstraArithmetic_Extend(Map, dim, ORIGI, DESTI );
        tDJ=toc;
        
        tic
        [ Optimal_O, D_O ] = DijkstraArithmetic(Map, dim, ORIGI, DESTI);
        tDJo=toc;
        
        %% Display %%%%
        disp(['Resonance:' num2str(tRA)]);
        DispPaths(pathNode, pathTime);
        
        disp(['Dijkstra_Extend:' num2str(tDJ)]);
        Display(Optimal, D);
        disp('-----------------');
        
        disp(['Dijkstra_Origin:' num2str(tDJo)]);
        Display(Optimal_O, D_O);
        disp('-----------------');
        
        %% Cache %%%%
        timeRA(find(N==iiSTA),iSTA)=tRA;
        timeDJ(find(N==iiSTA),iSTA)=tDJ;
        timeDJo(find(N==iiSTA),iSTA)=tDJo;

    end
    avgPaths(find(N==iiSTA),1)=round(sumPaths/num_map); % Calculate the avg num of paths
end

%% Final Save, rewrite the file %%
save('data/btimeRA.mat' , 'timeRA', '-v7');
save('data/btimeDJ.mat', 'timeDJ', '-v7');
save('data/btimeDJo.mat', 'timeDJo', '-v7');
save('data/bavgPaths.mat', 'avgPaths', '-v7');