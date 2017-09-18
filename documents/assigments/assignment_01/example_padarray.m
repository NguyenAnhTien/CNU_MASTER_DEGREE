disp('Example about padarray function')
f = [1 2; 3 4]
% Expanding araay after the last element for each dimension
% Elements using expand is values in its outer border
fp = padarray(f, [3 2], 'replicate', 'post')
