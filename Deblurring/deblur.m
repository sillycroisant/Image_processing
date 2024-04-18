%Deblurring cua may anh An Do
clc; clearvars; close all;

img = 'a5.jpg';

%Reading the image
H = ones(3,3)/9; %H filter
A = double(rgb2gray(imread(img)));
[M, N] = size(A);

%Degradation function
h = ones(3,3)/9;

freq_a = fft2(A);
freq_h = fft2(h,M,N);

%Image Degradation in Frequency domain
deg_a = freq_h .* freq_a;

%Degraded image in Spatial domain
B = real(ifft2(deg_a));

%Inverse filtering
freq_b = fft2(B);
powfreq_a = freq_a.^2/(M*N);
alpha = 0.5;
sigma = sqrt(4*10^(-7));
freq_g = ((freq_h.')').*abs(powfreq_a)./(abs(freq_h.^2).*abs(powfreq_a)+alpha*sigma^2);
Res_freq_a = freq_g .* freq_b;

%Restored image in spatial domain
Res_a = real(ifft2(Res_freq_a));

%Display of input and output images
imshow(uint8(A)); title('Original Image');
figure, imshow(uint8(B)); title('Degraded Image');
figure, imshow(uint8(Res_a)); title('Restored Image after inverse filtering');