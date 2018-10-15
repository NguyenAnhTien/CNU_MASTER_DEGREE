IntrinsicMatrix = [715.2699 0 0; 0 711.5281 0; 565.6995 355.3466 1];
radialDistortion = [-0.3361 0.0921]; 
cameraParams = cameraParameters('IntrinsicMatrix',IntrinsicMatrix,
                                'RadialDistortion',radialDistortion); 

I = imread('../figures/cube.png');
J = undistortImage(I,cameraParams);

figure; imshowpair(imresize(I, 0.5),imresize(J, 0.5),'montage');
title('Original Image (left) vs. Corrected Image (right)');

