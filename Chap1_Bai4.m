clc; close; clearvars;

img = imread('hui.jpg');

[col, row, dim] = size(img);

noise = uint8(randi(256,size(img)));

%Gaussian noise w Mean = 0 and Std = 5
gaus_noise = uint8(normrnd(0,5,size(img)));

y = img + gaus_noise;

yy = img + noise;

%figure; imshow(img); title('Origin');
%subplot(221); imshow(gaus_noise); title('GaussNoise');
%subplot(222); imshow(y); title('Origin + GaussNoise');

%subplot(223); imshow(noise); title('Noise');
%subplot(224); imshow(yy); title('Origin + Noise');

% Mean built-in function
mean1 = sum(img(:)) / (col*row*3);

% Mean DIY function



