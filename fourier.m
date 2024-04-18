clc, close, clearvars;

im = (imread('recwave.jpg'));
subplot(121), imshow(im), title('Original Image');
im = rgb2gray(im);
fim = fft2(im);
fim1 = fftshift(fim);
fim2 = 2*log(abs(fim1)+1);
subplot(122), imagesc(uint8(fim2)), title('Fourier transform');

