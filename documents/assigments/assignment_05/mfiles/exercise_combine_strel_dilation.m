%-----Open Morphological Image---------------------------------------------
% f = imread('../figures/fig_combine_dil_eros.tif');
% figure; imshow(f)
% se = strel('disk' , 20);
% fo = imopen(f, se);
% figure; imshow(fo)
%--------------------------------------------------------------------------

%-----Close Morphological Image--------------------------------------------
% fc = imclose(f, se);
% imshow(fc)
% fc = imclose(f, se);
% figure; imshow(fc)
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
f = imread ( '../figures/fig_combine_dil_eros_02.tif');
figure; imshow(f);
se = strel('square', 3);
fo = imopen(f, se);
figure; imshow(fo)
foc = imclose(fo, se);
figure; imshow(foc)
%--------------------------------------------------------------------------