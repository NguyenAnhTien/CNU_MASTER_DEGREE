randn('seed', 0);
m = [2 -2]; S = [0.9 0.2; 0.2 .3];

%Case 1: N = 500
X = mvnrnd(m,S,500)';
[m_hat, S_hat]=Gaussian_ML_estimate(X);

%Case 2: N = 5000
X = mvnrnd(m,S,5000)';
[m_hat, S_hat]=Gaussian_ML_estimate(X);
