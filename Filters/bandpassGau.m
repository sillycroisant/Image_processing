function bandpassGau
close all;
I = rgb2gray(imread('plumage.png'));
size(I)
figure;
subplot(121); imshow(I); title('Original Image');
S = fft2(double(I));

subplot(122); imagesc(uint8(2*log(abs(fftshift(S))+1))); title('Spectre');
[M,N] = size(S);
r = (M+1)/2; c = (N+1)/2;
[X,Y] = meshgrid(1:N,1:M);
radius = sqrt((X-c).^2+(Y-r).^2);
D0 = min(N/10,M/10);
F0 = exp(-1.*(radius.^2)/(2*(D0^2)));
D1 = min(N/2,M/2);
F1 = exp(-1.*(radius.^2)/(2*(D1^2)));
F = F1 - F0;
figure
subplot(131);
imshow(F,[]); title('Filter bandpass F');

subplot(132);
imshow(F1,[]); title('Filter F1');
subplot(133);
imshow(F0,[]); title('Filter F0');
S1 = fftshift(S).*F;
S1 = ifftshift(S1);
I1 = ifft2(S1);
figure, imshow(real(I1),[]); title('Filtered image');