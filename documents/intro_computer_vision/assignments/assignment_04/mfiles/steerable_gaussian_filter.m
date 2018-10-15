function steerable_gaussian_filter(I, theta, sigma)

theta = -theta * (pi/180);

% Determine necessary filter support (for Gaussian).
Wx = floor((5/2)*sigma); 
if Wx < 1
    Wx = 1
end

x = -Wx : Wx;

% Evaluate 1D Gaussian filter (and its derivative).
g = exp(-(x.^2)/(2*sigma^2));
gp = -(x/sigma).*exp(-(x.^2)/(2*sigma^2));


% Calculate image gradients (using separability).
Ix = conv2(conv2(I,-gp,'same'),g','same');
Iy = conv2(conv2(I,g,'same'),-gp','same');

% Evaluate oriented filter response.
J = cos(theta)*Ix+sin(theta)*Iy;
figure(1); clf; set(gcf,'Name','Oriented Filtering');
   subplot(2,2,1); imagesc(I); axis image; colormap(gray);
      title('Input Image');
   subplot(2,2,2); imagesc(J); axis image; colormap(gray);
      title(['Filtered Image (\theta = ',num2str(-theta*(180/pi)),'{\circ})']);
   subplot(2,1,2); imagesc(cos(theta)*(g'*gp)+sin(theta)*(gp'*g));
      axis image; colormap(gray);
      title(['Oriented Filter (\theta = ',num2str(-theta*(180/pi)),'{\circ})']);
