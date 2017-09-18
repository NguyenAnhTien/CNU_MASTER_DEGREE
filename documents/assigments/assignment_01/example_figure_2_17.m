f = imread('Fig0217(a).tif');
w = fspecial('laplacian', 0);
g1 = imfilter(f, w, 'conv', 'replicate');
f2 = tofloat(f);
g2 = imfilter(f2, w, 'conv', 'replicate');
g = f2 - g2;
figure,
subplot(2, 2, 1), imshow(f, []), title('(a)');
subplot(2, 2, 2), imshow(g1, []), title('(b)');
subplot(2, 2, 3), imshow(g2, []), title('(c)');
subplot(2, 2, 4), imshow(g, []), title('(d)');
