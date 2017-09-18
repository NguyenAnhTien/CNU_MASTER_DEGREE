%case 1
P1=1./6;
P2=5./6;
m1=[1 1]';
m2=[3 3]';
S=eye(2);
x=[1.8 1.8]';
p11=P1*comp_gauss_dens_val(m1,S,x);
p21=P2*comp_gauss_dens_val(m2,S,x);

% Case 2
P1=5./6;
P2=1./6;
p12=P1*comp_gauss_dens_val(m1,S,x);
p22=P2*comp_gauss_dens_val(m2,S,x);
