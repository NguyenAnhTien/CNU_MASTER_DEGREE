function g = fuzzyfilt(f)
[f, revertClass] = tofloat(f);
z1 = imfilter(f, [0 -1 1], 'conv', 'replicate');
z2 = imfilter(f, [0; -1; 1], 'conv', 'replicate');
z3 = imfilter(f, [1; -1; 0], 'conv', 'replicate');
z4 = imfilter(f, [1 -1 0], 'conv', 'replicate');
s = load('fuzzyedgesys');
g = s.G(z1, z2, z3, z4);
g = revertClass(g);
end
