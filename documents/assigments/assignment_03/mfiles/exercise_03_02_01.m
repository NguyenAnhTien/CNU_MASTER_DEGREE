% Exercise 3.2.2
clear;
close all;
clc;

%% Step 1
% To generate the data set X1 and a vector y1, whose i-th coordinate
% rng(0,'v4');
% S=[.3 1 1; 1 9 1; 1 1 9];
% [l,l]=size(S);
% mv=[-6 6 6; 6 6 6]';
% N=400;
% X1=[mvnrnd(mv(:,1),S,N); mvnrnd(mv(:,2),S,N)]';
% y1=[ones(1,N), 2*ones(1,N)];
% 
% % To compute the eigenvalues/eigenvectors and variance percentages
% m=3;
% [eigenval,eigenvec,explained,Y,mean_vec]=pca_fun(X1,m);
% explained
% % Plot X1
% figure(1), hold on
% figure(1), plot3(X1(1,y1==1),X1(2,y1==1),X1(3,y1==1),'r.',X1(1,y1==2),...
%     X1(2,y1==2),X1(3,y1==2), 'bo', 'LineWidth',2)
% figure(1), xlabel('X'), ylabel('Y'), zlabel('Z')
% % Compute the projections of X1
% w=eigenvec(:,1);
% t1=w'*X1(:,y1==1);
% t2=w'*X1(:,y1==2);
% X_proj1=[t1;t1;t1].*((w/(w'*w))*ones(1,length(t1)));
% X_proj2=[t2;t2;t2].*((w/(w'*w))*ones(1,length(t2)));
% 
% % Plot the projections
% figure(1), plot3(X_proj1(1,:),X_proj1(2,:), X_proj1(3,:),'k.',...
%     X_proj2(1,:),X_proj2(2,:),X_proj2(3,:), 'ko', 'LineWidth',2)
% figure(1), axis equal
% % 
% % % Plot the eigenvectors
% figure(1), line([0; eigenvec(1,1)], [0; eigenvec(2,1)],...
%     [0; eigenvec(3,1)], 'LineWidth',2)
% figure(1), line([0; eigenvec(1,2)], [0; eigenvec(2,2)],...
%     [0; eigenvec(3,2)], 'LineWidth',2)

%% Step 2
% To generate the data set X2 and a vector y2, whose i-th coordinate
rng(0,'v4');
S=[.3 1 1; 1 9 1; 1 1 9];
[l,l]=size(S);
mv=[-2 0 0; 2 0 0]';
N=400;
X2=[mvnrnd(mv(:,1),S,N); mvnrnd(mv(:,2),S,N)]';
y2=[ones(1,N), 2*ones(1,N)];
% 
% % To compute the eigenvalues/eigenvectors and variance percentages
m=3;
[eigenval,eigenvec,explained,Y,mean_vec]=pca_fun(X2,m);
explained
% 
% % Plot X1
figure(2), hold on
figure(2), plot3(X2(1,y2==1),X2(2,y2==1),X2(3,y2==1),'r.',X2(1,y2==2),...
    X2(2,y2==2),X2(3,y2==2), 'bo', 'LineWidth',2)
figure(2), xlabel('X'), ylabel('Y'), zlabel('Z')
% 
% % Compute the projections of X2
w=eigenvec(:,1);
t1=w'*X2(:,y2==1);
t2=w'*X2(:,y2==2);
X_proj1=[t1;t1;t1].*((w/(w'*w))*ones(1,length(t1)));
X_proj2=[t2;t2;t2].*((w/(w'*w))*ones(1,length(t2)));

% Plot the projections
figure(2), plot3(X_proj1(1,:),X_proj1(2,:), X_proj1(3,:),'k.',...
    X_proj2(1,:),X_proj2(2,:),X_proj2(3,:), 'ko', 'LineWidth',2)
figure(2), axis equal
% 
% % Plot the eigenvectors
figure(2), line([0; eigenvec(1,1)], [0; eigenvec(2,1)],...
    [0; eigenvec(3,1)], 'LineWidth',2)
figure(2), line([0; eigenvec(1,2)], [0; eigenvec(2,2)],...
    [0; eigenvec(3,2)], 'LineWidth',2)
