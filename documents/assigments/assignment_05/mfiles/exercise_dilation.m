A = imread ('../figures/fig_dilation_01.tif') ;
B = [0 1 0; 1 1 1 ; 0 1 0] ;
D = imdilate(A , B) ;
figure; imshow(D)
figure; imshow(A)