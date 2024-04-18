close all;
clearvars;
clc;

%Reading input image
A = imread('a5.jpg');
A = double(rgb2gray(A));
[M, N] = size(A);

%Degradation function
h = ones(3,3)/9;

%Transformation to frequnency domain
freq_a = fft2(A);
freq_h = fft2(h,M,N);

%Degraded image
B = real(ifft2(freq_h.*freq_a)) + 10*randn(M,N);

%Inverse filtering for image restoration
freq_b = fft2(B);
powfreq_a = freq_a.^2/(M*N);
alpha = 0.5;
sigma = sqrt(4*10^(-7));
freq_g = ((freq_h.')').*abs(powfreq_a)./(abs(freq_h.^2).*abs(powfreq_a)+alpha*sigma^2);
Res_freq_a = freq_g .* freq_b;

% Restored image in spatial domain
Res_a = real(ifft2(Res_freq_a));

% Display of input and output images
imshow(uint8(A)); title('original image');
figure, imshow(uint8(B)), title('degraded image');
figure, imshow(uint8(Res_a)), title('restored image');