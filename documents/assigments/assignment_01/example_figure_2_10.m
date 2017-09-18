I = imread('Fig0210(a).tif');
p = twomodegauss(0.15, 0.05, 0.75, 0.05, 1, 0.07, 0.002);% Biomodal Gauss function
g = histeq(f, p);% Histogram matching with biomodal gauss function
Undefined function or variable 'f'.
 
g = histeq(I, p);% Histogram matching with biomodal gauss function
figure
subplot(2,2,1),imshow(f),title('(a)'); % Image of the Mars moon Photos.
Undefined function or variable 'f'.
 
subplot(2,2,1),imshow(I),title('(a)'); % Image of the Mars moon Photos.
subplot(2,2,2),imshow(g),title('(b)'); % Histogram matching with biomodal gauss
subplot(2,2,3), plot(p), xlim([0 255]),title('(c)');% Biomodal Gauss function
subplot(2,2,4), imhist(g), xlim([0 255]), ylim([0 50000]),title('(d)');
