%plot 2 parallel line
plot([-1 3], [2 4], 'r')
hold on
plot([1 -3], [1 -1], 'r')

%define l_1
l_1 = [1 -2 5]';

%define l_2
l_2 = [1 -2 1]';

%solve linear equation system
syms x y z
eqn1 = x - 2*y + 5*z == 0;
eqn2 = x - 2 * y + z == 0;
sol = solve([eqn, eqn2], [x, y, z]);

%result
%sol.x = 0
%sol.y = 0
%sol.z = 0