close('all');
clear;
randn('seed',0);
l=2;
m1=[1 1]'; % centroids
m2=[2 2]';
[l,c1]=size(m1); %no of gaussians per class
[l,c2]=size(m2);

P1=ones(1,c1)/c1; % weights of the mixture model
P2=ones(1,c2)/c2;
s=4; % variance

% Generate the training data from the first class
N1=50; %Number of first class data points
for i=1:c1
    S1(:,:,i)=s*eye(l);
end
sed=0; %Random generator seed
[class1_X,class1_y]=mixt_model(m1,S1,P1,N1,sed);
% Generate the training data from the second class
N2=50; %Number of second class data points
for i=1:c2
    S2(:,:,i)=s*eye(l);
end
sed=0; 
[class2_X,class2_y]=mixt_model(m2,S2,P2,N2,sed);
X=[class1_X class2_X];
y=[ones(1,N1) -ones(1,N2)];

% Form X1
X1=[class1_X  class2_X]; %Data vectors
y1=[ones(1,N1) -ones(1,N2)]; %Class labels
figure(1), hold on
figure(1), plot(X1(1,y1==1),X1(2,y1==1),'r.',X1(1,y1==-1),X1(2,y1==-1),'bx')

% 1.
T_max=3000; % max number of base classifiers
[pos_tot, thres_tot, sleft_tot, a_tot, P_tot,K] = boost_clas_coord(X, y, T_max);

% 2.
[y_out, P_error] =boost_clas_coord_out(pos_tot, thres_tot, sleft_tot, a_tot, P_tot,K,X, y);
figure(2), plot(P_error)

% 3.
% Dataset Z is also generated in two steps,i.e., 50 points are first generated from 
% the first class (dataset Z1)
mZ11=[1.25 1.25]'; mZ12=[2.75 4.5]';mZ13=[2 11]';
mZ1=[mZ11 mZ12 mZ13];
SZ1(:,:,1)=0.1*eye(2);
SZ1(:,:,2)=0.2*eye(2);
SZ1(:,:,3)=0.3*eye(2);
wZ1=[0.4 0.4 0.2];
NZ1=50;
sed=100;
[Z1,yz1]=mixt_model(mZ1,SZ1,wZ1,NZ1,sed);

% The remaining 50 points from the second class (dataset Z2) are generated similarly (use
% again sed = 100).
mZ21=[2.75 0]'; mZ22=[1.25 2.75 ]';mZ23=[4 8]';
mZ2=[mZ21 mZ22 mZ23];
SZ2(:,:,1)=0.1*eye(2);
SZ2(:,:,2)=0.2*eye(2);
SZ2(:,:,3)=0.3*eye(2);
wZ2=[0.2 0.3 0.5];
NZ2=50;
sed=100;
[Z2,yz2]=mixt_model(mZ2,SZ2,wZ2,NZ2,sed);
% Form Z and respective labels
Z=[Z1 Z2];
y=[ones(1,NZ1) -ones(1,NZ2)];

% Classify the vectors of Z
[y_out_Z, P_error_Z] =boost_clas_coord_out(pos_tot, thres_tot, sleft_tot, a_tot, P_tot,K,Z, y);
figure(3), plot(P_error_Z)


