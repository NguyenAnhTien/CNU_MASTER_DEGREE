f = imread('../figures/exercise_reconstruction.tif');
fe = imerode(f, ones(51, 1));
fo = imopen(f, ones(51, 1));
fobr = imreconstruct(fe, f);
figure; imshow(f);
figure; imshow(fe);
figure; imshow(fo);
figure; imshow(fobr);