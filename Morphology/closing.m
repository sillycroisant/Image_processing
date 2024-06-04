im = rgb2gray(imread('nhom12a.bmp'));
im = im2bw(im);
se = [1 1 1; 1 1 1; 1 1 1];
close = imclose(im,se);
open = imopen(im,se);

figure
subplot(131), imshow(im);
subplot(132), imshow(close);
subplot(133), imshow(open);
