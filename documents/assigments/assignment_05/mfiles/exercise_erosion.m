A = imread('../figures/fig_erosion.tif') ;
%-------block code 1----------
% se = strel('disk', 10) ;
% E10 = imerode(A, se) ;
% figure; imshow(A);
% figure; imshow(E10)
%-----------------------------

%-------block code 2----------
% se = strel('disk', 5);
% E5 = imerode(A, se) ;
% imshow(E5)
%-----------------------------

%-------block code 3------------------
E20 = imerode(A , strel('disk', 20));
imshow(E20)
%-------------------------------------