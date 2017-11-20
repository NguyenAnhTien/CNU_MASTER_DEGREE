f = imread('../figures/Fig0709.tif');
[c, s] = wavefast(f, 4, 'jpeg9.7');
wavedisplay(c, s, 8);
f = wavecopy('a', c, s);                             %approximation 1
figure; imshow(mat2gray(f));
[c, s] = waveback(c, s, 'jpeg9.7', 1);               %approximation 2
f = wavecopy('a', c, s);
figure; imshow(mat2gray(f));
[c, s] = waveback(c, s, 'jpeg9.7', 1);               %approximation 3
f = wavecopy('a', c, s);
figure; imshow(mat2gray(f));
[c, s] = waveback(c, s, 'jpeg9.7', 1);               %approximation 4
f = wavecopy('a', c, s);
figure; imshow(mat2gray(f));
[c, s] = waveback(c, s, 'jpeg9.7', 1);               %Final image
f = wavecopy('a', c, s);
figure; imshow(mat2gray(f));