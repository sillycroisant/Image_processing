I = [10 9 9 9 8 8; 10 10 10 9 9 9; 7 7 8 8 8 7; 7 7 9 9 9 9; 8 8 10 10 11 12; 8 8 10 11 12 12];
im = imread('600800.jpg');
G = rgb2gray(im);
F = [0 -1 0; -1 4 -1;0 -1 0];
Y = conv2(G,F, 'same');
subplot(121), imshow(G);
subplot(122), imshow(uint8(Y))
