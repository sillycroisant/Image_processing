clc, close, clearvars;

im = imread('kodim23.png');

h = ones(1,21);
H = h'*h;

Hf_img = conv2(im,h,'same');

figure, imshow(Hf_img);

im1 = im(1:2:end,1:2:end,:);



