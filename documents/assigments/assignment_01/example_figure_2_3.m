%using imadjust function
%using imcomplement function
%using stretchlim function

%==========block code 01=====================
I = imread('Fig0203.tif')
imshow(I);
%============================================

%==========block code 02=====================
g = imadjust(I, [0 1], [1 0]);
imshow(g);
%============================================

%==========block code 03=====================
g = imcomplement(I);
imshow(g);
%============================================

%==========block code 04=====================
g = imadjust(f, [0.5 0.75], [0 1]);
imshow(g);
%============================================

%==========block code 05=====================
g = imadjust(I, stretchlim(I), [1 0]);
imshow(g);
%============================================
