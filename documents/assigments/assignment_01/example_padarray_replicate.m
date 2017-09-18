f = [1 2; 3 4];
gmean = @(A) prod(A,1).^(1/size(A,1));
m = 3;
n = 2;
fp = padarray(f, [m n], 'replicate');
g = colfilt(fp, [m n], 'sliding', gmean);

