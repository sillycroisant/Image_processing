clc; clearvars; close;

img = imread('hui.jpg');

im1 = ceil(img/2)*2;
im2 = ceil(img/4)*4;
im3 = ceil(img/8)*8;
im4 = ceil(img/16)*16;

subplot(221);
imshow(img); title('Origin Img');

subplot(222);
imshow(im1); title('7bit Quantized');

subplot(223);
imshow(im2); title('6bit Quantized');

subplot(224);
imshow(im4); title('4bit Quantized');