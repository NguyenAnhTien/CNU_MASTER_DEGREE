m=[0; 2]';
S(:,:,1)=[0.2];
S(:,:,2)=[0.2];
P=[1/3 2/3];
N=100;
rng(0,'v4');
[X, y]=generate_gauss_classes(m,S,P,N);

N1 = 2000;
rng(100,'v4');
[X1,y1]=generate_gauss_classes(m,S,P,N1);
[X1, I] = sort(X1,'ascend');
y1 = y1(I);

h=[0.001,0.005,0.01,0.05,0.1,];

for i=1:length(h)
    z_bayesian=bayes_classifier_parzen(X,y,h(i),X1,m,P);
    err_bayesian(i) = (1-length(find(y1==z_bayesian))/length(y1));
end
