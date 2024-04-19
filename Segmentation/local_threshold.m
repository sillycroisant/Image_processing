clc; close; clearvars;

name = 'coin.jpg';
im = imread(name);
im = rgb2gray(im);
%Adjust those parameter to get a better result
bw2 = imbinarize(im,'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);
subplot(121), imshow(im), title('origin img');
subplot(122), imshow(bw2), title('segment img');