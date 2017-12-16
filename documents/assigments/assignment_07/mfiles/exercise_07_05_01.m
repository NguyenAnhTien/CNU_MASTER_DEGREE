% 1. Generate the required data set
randn('seed', 0);
m=[0 0];
S(:,:,1)=eye(2);
n_points=100*ones(1, 3);
X1=[];
for i=1:1
    X1=[X1; mvnrnd(m(i,:),S(:,:,i),n_points(i))];
end
X1=X1';

% Plot the data set
figure(1), plot(X1(1,:),X1(2,:),'.b')
figure(1), axis equal

% 2. To apply the k-means algorithm, for m = 2 and random initialization
m=2;
[l,N]=size(X1);
rand('seed',0)
theta_ini=rand(l,m);
[theta,bel,J]=k_means(X1,theta_ini);

% Plot X3, using different colors for points from different clusters
figure(2), hold on
figure(2), plot(X1(1,bel==1),X1(2,bel==1),'r.',...
X1(1,bel==2),X1(2,bel==2),'g*',X1(1,bel==3),X1(2,bel==3),'bo',...
X1(1,bel==4),X1(2,bel==4),'cx',X1(1,bel==5),X1(2,bel==5),'md',...
X1(1,bel==6),X1(2,bel==6),'yp',X1(1,bel==7),X1(2,bel==7),'ks')
figure(2), plot(theta(1,:),theta(2,:),'k+')
figure(2), axis equal

% 4. Work as in step 2, for m = 3
m=3;
[l,N]=size(X1);
rand('seed',0)
theta_ini=rand(l,m);
[theta,bel,J]=k_means(X1,theta_ini);
figure(4), hold on
figure(4), plot(X1(1,bel==1),X1(2,bel==1),'r.',...
X1(1,bel==2),X1(2,bel==2),'g*',X1(1,bel==3),X1(2,bel==3),'bo',...
X1(1,bel==4),X1(2,bel==4),'cx',X1(1,bel==5),X1(2,bel==5),'md',...
X1(1,bel==6),X1(2,bel==6),'yp',X1(1,bel==7),X1(2,bel==7),'ks')
figure(4), plot(theta(1,:),theta(2,:),'k+')
figure(4), axis equal
