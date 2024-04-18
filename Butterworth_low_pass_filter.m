%Bai 12 , lam lai bai 11 voi bo loc Butterworth
clc, clearvars, close all;

im = rgb2gray(imread('a1.jpg'));
fc = 10;
n = 1;
[c0, r0] = size(im);
cx = round(c0/2);
cy = round(r0/2);
imf = fftshift(fft2(im));
H = zeros(c0, r0);

for i = 1 : c0
    for j = 1 : r0
        d = (i-cx).^2 + (j-cy).^2;
        H(i,j) = 1/(1 + ((d/fc/fc).^(2*n)));
    end
end

outf = imf.*H;
out = abs(ifft2(outf));

figure
%subplot(131), imshow(im), title('Original Image');
%subplot(132), imshow(uint8(out)), title('Butterworth Low Pass filter Image');
subplot(133), imshow(abs(outf)), title('Butterworth Filter');
