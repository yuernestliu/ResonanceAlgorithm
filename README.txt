1. ﻿Folders:
1)data: 
	Stores all .mat files. The .mat files record time consumption of each algorithm in different maps.
2)newMaps2: (unzip newMaps2.zip)
	Stores all maps. There are 30 different scales and there are 50 random maps under each scale, that is, we tested 1500 maps totally.


2. .m files:
	1)main.m:
		Run it to test 4 algorithm in 1500 maps. Time consumption is stored as output in .mat files, data folder.

	2)main_make_map.m:
		Run it to generate 1500 maps. We use Dijkstra to make sure every map is a connected graph.

	3)OrderMap.m:
		Change an adjacency table to an adjacency matrix.

	4)make_time_table.m:
		Through Dijkstra, create a timetable as a heuristic function h() of the AS algorithm.

	5)Display.m
		Display code of Dijkstra and Dijkstra_Extend.


3. Resonance (Folder):
	1)resonanceAlg.m
		Guide code of Dijkstra and Resonance algorithm.

	2)Forward.m , Backward.m , FindPaths.m :
		Core code of Resonance Algorithm. Corresponding to the forward, backward, and overlapping processes of the Resonance Algorithm.

	3)NodesBook.m:
		Gives which node links to which in Resonance Algorithm.

	4)print_path.m: 
		Recurse to organize the shortest path into an easy-to-read form.

	5)DispPaths.m:
		Display.


4. Dijkstra (Folder):
	1)Dijkstra_Arithmetic.m:
		Guides to the optimized Dijkstra, which can only find one shortest path. 

	2)Compute.m:
		Core computing code of Dijkstra_Extend, Dijkstra_Origin.


5. Dijkstra_Extend (Folder):
	1)Dijkstra_Arithmetic_Extend.m:
		Guides to the optimized Dijkstra, which can find all the shortest paths.

	2)Compute_Extend.m:
		Core computing code of Dijkstra_Extend, Dijkstra_Origin.




