clc, close, clearvars;

im  = imread('huiCFA.png');

Frb = [1 2 1; 2 4 2; 1 2 1]/4;
Fg = [0 1 0; 1 4 1; 0 1 0]/4;

final(:,:,1) = conv2(double(im(:,:,1)),double(Frb),'same');
final(:,:,2) = conv2(double(im(:,:,2)),double(Fg),'same');
final(:,:,3) = conv2(double(im(:,:,3)),double(Frb),'same');

subplot(121), imshow(im);
subplot(122), imshow(uint8(final));