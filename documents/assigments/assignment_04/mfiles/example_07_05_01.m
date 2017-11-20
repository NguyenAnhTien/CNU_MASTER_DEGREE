f = imread('../figures/Fig0707.tif');
imshow(f);
[c, s] = wavefast(f, 1, 'sym4');
figure; wavedisplay(c, s, -6);
[nc, y] = wavecut('a', c, s);
figure; wavedisplay(nc, s, -6);
edges = abs(waveback(nc, s, 'sym4'));
figure; imshow(mat2gray(edges));