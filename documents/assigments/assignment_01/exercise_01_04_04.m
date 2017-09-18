m=[0 0 0; 1 2 2; 3 3 4]';
S1=[0.8,0.2,0.1; 0.2,0.8,0.2; 0.1,0.2,0.8];
S2=[0.6,0.01,0.01; 0.01,0.8,0.01; 0.01,0.01,0.6];
S3=[0.6,0.1,0.1; 0.1,0.6,0.1; 0.1,0.1,0.6];
S(:,:,1)=S1;S(:,:,2)=S2;S(:,:,3)=S3;
P=[1/3 1/3 1/3]';
N=1000;
rng(0,'v4');
[X,y]=generate_gauss_classes(m,S,P,N);

rng(100,'v4');
[X1,y1]=generate_gauss_classes(m,S,P,N);

class1_data=X(:,find(y==1));
[m1_hat, S1_hat]=Gaussian_ML_estimate(class1_data);
class2_data=X(:,find(y==2));
[m2_hat, S2_hat]=Gaussian_ML_estimate(class2_data);
class3_data=X(:,find(y==3));
[m3_hat, S3_hat]=Gaussian_ML_estimate(class3_data);
S_hat=(1/3)*(S1_hat+S2_hat+S3_hat);
m_hat=[m1_hat m2_hat m3_hat];

z_euclidean=euclidean_classifier(m_hat,X1);
z_mahalanobis=mahalanobis_classifier(m_hat,S_hat,X1);
z_bayesian=bayes_classifier(m,S,P,X1);

err_euclidean = (1-length(find(y1==z_euclidean))/length(y1))
err_mahalanobis = (1-length(find(y1==z_mahalanobis))/length(y1))
err_bayesian = (1-length(find(y1==z_bayesian))/length(y1))
