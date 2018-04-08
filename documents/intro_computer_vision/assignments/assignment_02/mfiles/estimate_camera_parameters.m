%Visualize Single Camera Extrinsic Parameters

%step 1: load image file names
images = imageDatastore(fullfile(toolboxdir('vision'),'visiondata', ...
  'calibration','webcam'));

imageFileNames = images.Files(1:3);

%detect calibration pattern
[imagePoints,boardSize] = detectCheckerboardPoints(imageFileNames);

%Generate world coordinates of the corners of the squares. The square size is in millimeters.
squareSide = 25;
worldPoints = generateCheckerboardPoints(boardSize,squareSide);

%estimate camera parameters
I = readimage(images,1); 
imageSize = [size(I, 1), size(I, 2)];
cameraParams = estimateCameraParameters(imagePoints,worldPoints, ...
                                  'ImageSize',imageSize);
                              
%Visualize pattern locations
%figure
%showExtrinsics(cameraParams);
