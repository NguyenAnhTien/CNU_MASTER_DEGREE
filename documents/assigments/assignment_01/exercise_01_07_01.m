m=[0; 2]';
S(:,:,1)=[0.2];
S(:,:,2)=[0.2];
P=[1/3 2/3];
N=[1000;10000];

x=-5:0.1:5;
h=[0.01;0.1];
pdfx = cell(2,1);
pdfx_approx = cell(2,1);
for i=1:2
    pdfx{i}=(1/3)*(1/sqrt(2*pi*0.2))*exp(-.5*(x.^2)/0.2)+(2/3)*(1/sqrt(2*pi*0.2))*...
        exp(-.5*((x-2).^2)/0.2);
    rng(0,'v4');
    [X]=generate_gauss_classes(m,S,P,N(i));
    pdfx_approx{i}=Parzen_gauss_kernel(X,h(i),-5,5);

    figure;
    plot(x,pdfx{i}, 'LineWidth', 1.5); hold;
    plot(-5:h(i):5,pdfx_approx{i},'r', 'LineWidth', 1.5);
    xlabel('X'); ylabel('pdf');
    legend('pdfX','pdfX-approx.','Location','NorthWest');
    annotation('textbox',...
        [0.1555 0.65 0.195 0.1],...
        'String',{['h = ' num2str(h(i)) ','],['N = ' num2str(N(i))]},...
        'FontSize', 14,...
        'LineWidth',2,...
        'Color',[0.84 0.16 0]);
    set(gca, 'FontSize', 14);
    set(gca, 'LineWidth', 2);
end
