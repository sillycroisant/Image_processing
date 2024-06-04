close all, clc;
i = imread('circles.png');
im = i;

se = strel('diamond',10);
fill = imdilate(im,se);
fill = imerode(fill,se);
fill = imerode(fill,se);
fill = fill | im;

figure
subplot(121), imshow(im);
subplot(122), imshow(fill);
figure
imshowpair(im,fill);