m1 = [1 1]';
m2 = [3 3]';
S = eye(2);
x = [1.8 1.8]';

%case 1: P1 = 1/6 and P2 = 5/6
P1 = 1 / 6.0;
P2 = 5 / 6.0;
p1 = P1 * comp_gauss_dens_val(m1, S, x);
p2 = P2 * comp_gauss_dens_val(m2, S, x);

%case 2: P1 = 5/6 and P2 = 1/6
P1 = 5 / 6.0;
P2 = 6 / 6.0;
p1 = P1 * comp_gauss_dens_val(m1, S, x);
p2 = P2 * comp_gauss_dens_val(m2, S, x);
