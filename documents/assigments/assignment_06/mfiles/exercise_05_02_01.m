% Example 5.2.1
% "Introduction to Pattern Recognition: A MATLAB Approach"
% S. Theodoridis, A. Pikrakis, K. Koutroumbas, D. Cavouras

close('all');
clear

% % Use function editDistance
% [editCost,Pred]=editDistance('impose','igposre');
% 
% % To extract the matching path, give matrix Pred as input to function
% % BackTracking as follows
% figure(1);
% L_test=length('igposre'); % number of rows of the grid (i.e., length of the unknown pattern)
% L_ref=length('impose'); % number of columns of the grid (i.e., length of the reference pattern
% [BestPath]=BackTracking(Pred,L_test,L_ref,1,'impose','igposre'); % the fourth argument is set to 1 so as to plot the grid and best-path


% Similarly, to compute the Edit cost for matching "teplatte" against "template" type

% [editCost,Pred]=editDistance('template','teplatte');
% figure(2);
% L_test=length('teplatte'); % number of rows of the grid (i.e., length of the unknown pattern)
% L_ref=length('template'); % number of columns of the grid (i.e., length of the reference pattern)
% [BestPath]=BackTracking(Pred,L_test,L_ref,1,'template','teplatte');

% % Use function editDistance
% [editCost,Pred]=editDistance('ignore','igposre');
% 
% % To extract the matching path, give matrix Pred as input to function
% % BackTracking as follows
% figure(1);
% L_test=length('igposre'); % number of rows of the grid (i.e., length of the unknown pattern)
% L_ref=length('ignore'); % number of columns of the grid (i.e., length of the reference pattern
% [BestPath]=BackTracking(Pred,L_test,L_ref,1,'ignore','igposre'); % the fourth argument is set to 1 so as to plot the grid and best-path

% Use function editDistance
[editCost,Pred]=editDistance('restore','igposre');

% To extract the matching path, give matrix Pred as input to function
% BackTracking as follows
figure(1);
L_test=length('igposre'); % number of rows of the grid (i.e., length of the unknown pattern)
L_ref=length('restore'); % number of columns of the grid (i.e., length of the reference pattern
[BestPath]=BackTracking(Pred,L_test,L_ref,1,'restore','igposre');