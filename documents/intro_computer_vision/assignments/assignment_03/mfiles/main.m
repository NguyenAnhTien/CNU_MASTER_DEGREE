%
theta = 0:15:360;

I = imread('cameraman.gif');
I = mean(double(I),3);

for i = 1 : length(theta)
   steerable_gaussian_filter(I,theta(i),3);
   pause(0.1);
end