close all;
clc;
clearvars;

i = rgb2gray(imread('plumage.png'));
h = ones(3,3)/9;
y = conv2(double(i), double(h), 'same');

figure;
imshow(y);

