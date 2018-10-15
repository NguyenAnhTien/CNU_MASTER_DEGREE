clc;
clear all;
close all;
image_name='stroke-ct2.jpg'; %%Change this if you have diff name
teeth_image=imread(image_name);
subplot(1,2,1)
imshow(teeth_image)
grayscale_teeth=rgb2gray(teeth_image);
segmented_teeth=im2bw(grayscale_teeth,0.4);
subplot(1,2,2)
imshow(segmented_teeth);
