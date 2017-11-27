lut = makelut(@conwaylaws , 3);
bw1 = [0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0
       0 0 0 1 0 0 1 0 0 0
       0 0 0 1 1 1 1 0 0 0
       0 0 1 0 0 0 0 1 0 0
       0 0 1 0 1 1 0 1 0 0
       0 0 1 0 0 0 0 1 0 0
       0 0 0 1 1 1 1 0 0 0
       0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0];
imshow(bw1 , 'InitialMagnification' , 'fit'), title('Generation 1')
bw2 = applylut(bw1, lut ) ;
figure, imshow(bw2, 'InitialMagnification', 'fit'); title('Generation 2')
bw3 = applylut(bw2, lut);
figure, imshow(bw3, 'InitialMagnification' , 'fit' ); title('Generation 3')