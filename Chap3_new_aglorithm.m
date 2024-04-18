clc, close, clearvars;

im = imread('huiCFA.png');

subplot(221), imshow(im), title('Origin');

%First
lumFilt = 1/64*[-2 3 -6 3 -2; 3 4 2 4 3; -6 2 48 2 -6; 3 4 2 4 3; -2 3 -6 3 -2];
lum = zeros(size(im));
lum(:,:,1) = conv2(double(im(:,:,1),double(

