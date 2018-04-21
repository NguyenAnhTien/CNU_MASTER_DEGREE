I = imread('picture_03.PNG');
% imshow(I)
% title('Original Image')
Idiffusion = imdiffusefilt(I);
montage({I, Idiffusion},'ThumbnailSize',[])
title('Original Image vs. Anisotropic Diffusion')
