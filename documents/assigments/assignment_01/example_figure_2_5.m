
I = imread('Fig0205.tif');
%g = im2uint8(mat2gray(log(1 + double(I))));
g = (mat2gray(log(1 + double(I))));
imshow(g);
