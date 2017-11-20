f = imread('../figures/Fig0707.tif');
[c, s] = wavefast(f, 4, 'sym4');
wavedisplay(c, s, 20);
[c, g8] = wavezero(c, s, 1, 'sym4');
[c, g8] = wavezero(c, s, 3, 'sym4');
[c, g8] = wavezero(c, s, 3, 'sym4');
[c, g8] = wavezero(c, s, 4, 'sym4');



