clc; close all; clearvars;

%Read img_
i_s = double(rgb2gray(imread('a5.jpg')));
i_f = fft2(i_s);
[row, col] = size(i_s);

figure;
subplot(321), imshow(uint8(i_s)), title('image in spatial');
subplot(322), imshow(uint8(i_f)), title('image in freq');

h_s = ones(3,3)/9;
h_f = fft2(h_s, row, col);

subplot(323), imshow(real(h_s)), title('filter in spatial');
subplot(324), imshow(real(h_f)), title('filter in freq');

y_f = i_f.*h_f;
y_s = real(ifft2(y_f));
subplot(325), imshow(uint8(y_s)), title('recoverd img in spatial');
subplot(326), imshow(uint8(y_f)), title('recoverd img in freq');

figure;
subplot(121), imshow(uint8(i_s)); title('original img');
subplot(122), imshow(uint8(y_s)); title('recovered img');
