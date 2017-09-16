function p = manualhist
p = twomodegauss(0.15, 0.05, 0.75, 0.05, 1, 0.07, 0.002);
figure, plot(p);
xlim([0 255]);
end