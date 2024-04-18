clc; close all; clearvars;

i_s = double(rgb2gray(imread('a5.jpg')));
i_f = fft2(i_s);

figure;
subplot(321), imshow(uint8(i_s)), title('image in spatial');
subplot(322), imshow(uint8(i_f)), title('image in freq');

h_s = ones(3,3)/9;
h_f = psf2otf(h_s, size(i_s));

subplot(323), imshow(real(h_s)), title('filter in spatial');
subplot(324), imshow(real(h_f)), title('filter in freq');

y_s = real(ifft2(i_f.*h_f)) + 10*randn(size(i_s));
subplot(325), imshow(uint8(y_s)), title('blurred img in spatial');
%subplot(326), imshow(uint8(y_f)), title('recoverd img in freq');

res_i = ;

figure;
subplot(131), imshow(uint8(i_s)), title('original img');
subplot(132), imshow(uint8(y_s)), title('blurred img');
subplot(133), imshow(uint8(res_i)), titel('recovered img');