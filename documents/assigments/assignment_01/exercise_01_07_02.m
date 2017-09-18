m1=[0, 0]'; m2=[0, 2]';
m = [m1 m2];
S(:,:,1)=[0.2 0;0 0.2];
S(:,:,2)=[0.2 0;0 0.2];
P=[1/3 2/3];
N=1000;
rng(0,'v4');
[X]=generate_gauss_classes(m,S,P,N);

[x1,x2] = meshgrid(-5:0.1:5, -5:0.1:5);
sigma_square = 0.2;
pdfx=(1/3)*(1/sqrt(2*pi*sigma_square))*exp(-.5*((x1.^2)+(x2.^2))/sigma_square)+(2/3)*(1/sqrt(2*pi*sigma_square))*exp(-.5*((x1).^2+((x2-2).^2))/sigma_square);
mesh(x1, x2, pdfx, 'LineWidth', 0.5);
xlabel('x1');
ylabel('x2');
zlabel('pdf');
view(-120,50); %// For a better view
colorbar; %// Add a colour bar for good measure

h=0.1;
pdfx_approx=Parzen_2dgauss_kernel(X,h,-5,5);
figure;
mesh(x1, x2, pdfx_approx, 'LineWidth', 0.5);
xlabel('x1');
ylabel('x2');
zlabel('pdf');
view(-120,50); %// For a better view
colorbar; %// Add a colour bar for good measure
