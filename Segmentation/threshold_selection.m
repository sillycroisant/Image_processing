close, clc;

image = imread('coin.jpg');
gray = rgb2gray(image);

mean_img = imfilter(gray, fspecial('average',[15,15]),'replica');
subtract = gray - (mean_img + 10);

black_white = im2bw(subtract, 0);

figure
subplot(121), imshow(black_white);
subplot(122), imshow(image);

