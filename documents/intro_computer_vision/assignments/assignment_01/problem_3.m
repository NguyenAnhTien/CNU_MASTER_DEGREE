%create an object for transformation
cb = checkerboard(4,2);
cb_ref = imref2d(size(cb));

% %create background to highlighting the position of the checkerboard
background = zeros(150);
imshowpair(cb,cb_ref,background,imref2d(size(background)))
 
% %create a translation matrix
% %affine2d create a transformation object from a matrix 
T = [1 0 0;0 1 0;100 0 1];
tform_t = affine2d(T);
% 
% 
% %create a rotation matrix
R = [cosd(30) sind(30) 0;-sind(30) cosd(30) 0;0 0 1];
tform_r = affine2d(R);
% 
% %translation followed by rotation
TR = T*R;
tform_tr = affine2d(TR);
[out,out_ref] = imwarp(cb,cb_ref,tform_tr);
imshowpair(out,out_ref,background,imref2d(size(background)))

