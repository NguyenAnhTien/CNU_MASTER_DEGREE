% Example 7.5.5
% "Introduction to Pattern Recognition: A MATLAB Approach"
% S. Theodoridis, A. Pikrakis, K. Koutroumbas, D. Cavouras

% 1. Generate X3
% randn('seed',0)
% m=[0 0; 10 0; 0 9; 9 8];
% S(:,:,1)=eye(2);
% S(:,:,2)=[1.0 .2; .2 1.5];
% S(:,:,3)=[1.0 .4; .4 1.1];
% S(:,:,4)=[.3 .2; .2 .5];
% n_points=100*ones(1,4); %Number of points per group
% X3=[];
% for i=1:4
%     X3=[X3; mvnrnd(m(i,:),S(:,:,i),n_points(i))];
% end
% X3=X3';
% 
% figure(1), plot(X3(1,:),X3(2,:),' b.')
% figure(1), axis equal

%-------------------------------------PAM----------------------------------
% [l,N]=size(X3);
% m=4; %Number of clusters
% sed=0; %Seed for the randn function
% [bel,cost,w,a]=k_medoids(X3,m,sed);
% 
% figure(2), hold on
% figure(2), plot(X3(1,bel==1),X3(2,bel==1),'r.',...
% X3(1,bel==2),X3(2,bel==2),'g*',X3(1,bel==3),X3(2,bel==3),'bo',...
% X3(1,bel==4),X3(2,bel==4),'cx',X3(1,bel==5),X3(2,bel==5),'md',...
% X3(1,bel==6),X3(2,bel==6),'yp',X3(1,bel==7),X3(2,bel==7),'ks')
% figure(2), plot(w(1,:), w(2,:),'k+')
% figure(2), axis equal
%---------------------------END-------PAM----------------------------------

% %%%%%%%% Repeat with the dataset of Example 7.5.2
% randn('seed',0)
% m=[0 0; 10 0; 0 9; 9 8];
% S(:,:,1)=eye(2);
% S(:,:,2)=[1.0 .2; .2 1.5];
% S(:,:,3)=[1.0 .4; .4 1.1];
% S(:,:,4)=[.3 .2; .2 .5];
% n_points=100*ones(1,4); 
% X3=[];
% for i=1:4
%     X3=[X3; mvnrnd(m(i,:),S(:,:,i),n_points(i))];
% end
% X3=X3';
% % Generate the remaining 100 points
% noise=rand(2,100)*14-2;
% X3=[X3 noise];
% 
% % Plot the data set
% figure(3), plot(X3(1,:),X3(2,:),'.b')
% figure(3), axis equal
% % 
% [l,N]=size(X3);
% m=4; %Number of clusters
% sed=0; %Seed for the randn function
% [bel,cost,w,a]=k_medoids(X3,m,sed);
% 
% figure(4), hold on
% figure(4), plot(X3(1,bel==1),X3(2,bel==1),'r.',...
% X3(1,bel==2),X3(2,bel==2),'g*',X3(1,bel==3),X3(2,bel==3),'bo',...
% X3(1,bel==4),X3(2,bel==4),'cx',X3(1,bel==5),X3(2,bel==5),'md',...
% X3(1,bel==6),X3(2,bel==6),'yp',X3(1,bel==7),X3(2,bel==7),'ks')
% figure(4), plot(w(1,:), w(2,:),'k+')
% figure(4), axis equal
% % 
% %%%%%%%% Repeat with the dataset of Example 7.4.2
% % Generate the required data set
% randn('seed',0);
% m=[0 0; 4 0; 0 4; 5 4];
% S(:,:,1)=eye(2);
% S(:,:,2)=[1.0 .2; .2 1.5];
% S(:,:,3)=[1.0 .4; .4 1.1];
% S(:,:,4)=[.3 .2; .2 .5];
% n_points=100*ones(1,4); %Number of points per group
% X3=[];
% for i=1:4
%     X3=[X3; mvnrnd(m(i,:),S(:,:,i),n_points(i))];
% end
% X3=X3';
% 
% % Plot the data set
% figure(5), plot(X3(1,:),X3(2,:),'.b')
% figure(5), axis equal
% [l,N]=size(X3);
% m=4; %Number of clusters
% sed=0; %Seed for the randn function
% [bel,cost,w,a]=k_medoids(X3,m,sed);
% 
% figure(6), hold on
% figure(6), plot(X3(1,bel==1),X3(2,bel==1),'r.',...
% X3(1,bel==2),X3(2,bel==2),'g*',X3(1,bel==3),X3(2,bel==3),'bo',...
% X3(1,bel==4),X3(2,bel==4),'cx',X3(1,bel==5),X3(2,bel==5),'md',...
% X3(1,bel==6),X3(2,bel==6),'yp',X3(1,bel==7),X3(2,bel==7),'ks')
% figure(6), plot(w(1,:), w(2,:),'k+')
% figure(6), axis equal
% 
% 
% %%%%%%%% Repeat with the dataset of Exercise 7.5.1
% % Generate the required data set
randn('seed',0);
m=[0 0];
S(:,:,1)=eye(2);
n_points=300; %Number of points per group
X3=mvnrnd(m,S(:,:,i),n_points)';
% Plot the data set
figure(7), plot(X3(1,:),X3(2,:),'.b')
figure(7), axis equal


[l,N]=size(X3);
m=4; %Number of clusters
sed=0; %Seed for the randn function
[bel,cost,w,a]=k_medoids(X3,m,sed);

figure(8), hold on
figure(8), plot(X3(1,bel==1),X3(2,bel==1),'r.',...
X3(1,bel==2),X3(2,bel==2),'g*',X3(1,bel==3),X3(2,bel==3),'bo',...
X3(1,bel==4),X3(2,bel==4),'cx',X3(1,bel==5),X3(2,bel==5),'md',...
X3(1,bel==6),X3(2,bel==6),'yp',X3(1,bel==7),X3(2,bel==7),'ks')
figure(8), plot(w(1,:), w(2,:),'k+')
figure(8), axis equal
