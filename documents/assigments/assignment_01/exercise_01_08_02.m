m=[0; 2]';
S(:,:,1)=[0.2];
S(:,:,2)=[0.2];
P=[1/3 2/3];
N=1000;
rng(0,'v4');
[X, y]=generate_gauss_classes(m,S,P,N);

N1 = 100000;
rng(100,'v4');
[X1,y1]=generate_gauss_classes(m,S,P,N1);
[X1, I] = sort(X1,'ascend');
y1 = y1(I);

k=[1,3,7,15,21];

for i=1:length(k)
    z_bayesian=bayes_classifier_knn(X,y,k(i),X1,m,P);
    err_bayesian(i) = (1-length(find(y1==z_bayesian))/length(y1));
end
