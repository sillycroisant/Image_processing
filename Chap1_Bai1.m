clc; clearvars; close;

img = imread('600800.jpg');

im1 = img(1:2:end, 1:2:end,:);
im2 = im1(1:2:end, 1:2:end,:);
im3 = im2(1:2:end, 1:2:end,:);
%im4 = im3(1:2:end, 1:2:row,:);

subplot(221);
imshow(img);title('Origin Image');
subplot(222);
imshow(im1);title('Downsampled 2x2');
subplot(223);
imshow(im2);title('Downsampled 4x4');
subplot(224);
imshow(im3);title('Downsampled 8x8');





