randn('seed', 0)
m = [2 -2]';
S = [0.9 0.2; 0.2 0.3];

%case 1: N = 500 points
X = mvnrnd(m, S, 500)';
[m_hat, S_hat] = Gaussian_ML_estimate(X);

%case 2: N = 5000 points
X = mvnrnd(m, S, 5000)';
[m_hat, S_hat] = Gaussian_ML_estimate(X);
