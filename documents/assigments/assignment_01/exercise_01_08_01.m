%% 1. The pdf is actually a Gaussian mixture model. 
% To this end, utilize the function generate_gauss_classes to generate the required dataset
m=[0; 1]';
S(:,:,1)=[1];
S(:,:,2)=[1];
P=[1/3 2/3];
N=[200,5000];
k=[5,100];

% Plot the pdf
x=-5:0.1:5;
pdfx=(1/3)*(1/sqrt(2*pi))*exp(-(x.^2)/2)+(2/3)*(1/sqrt(2*pi))*exp(-((x-1).^2)/2);

% Use function knn_density_estimate to estimate the pdf (k=21)
pdfx_approx = cell(2,1);
for i=1:2
    for j=1:2
        rng(0,'v4');
        [X]=generate_gauss_classes(m,S,P,N(i));
        pdfx_approx{i}{j}=knn_density_estimate(X,k(j),-5,5,0.1);
        figure;
        plot(x,pdfx,'LineWidth', 1.5); hold;
        plot(x,pdfx_approx{i}{j},'r','LineWidth', 1.5)
        xlabel('X'); ylabel('pdf');
        legend('pdfX','pdfX-approx.','Location','NorthWest');
        annotation('textbox',...
            [0.1555 0.65 0.195 0.1],...
            'String',{['k = ' num2str(k(j)) ','],['N = ' num2str(N(i))]},...
            'FontSize', 14,...
            'LineWidth',2,...
            'Color',[0.84 0.16 0]);
        set(gca, 'FontSize', 14);
        set(gca, 'LineWidth', 2);
    end
end
