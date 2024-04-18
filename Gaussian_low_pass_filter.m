%Bo loc thong thap Gaussian
clc, clearvars, close all;

im = rgb2gray(imread('phongcanh04.jpg'));


[col, row] = size(im);
D0 = 0.5*min(col,row);
H = zeros(col, row);
cx = round(col/2);
cy = round(row/2);
imf = fftshift(fft2(im));

for i = 1 : col
    for j = 1 : row
        d = (i-cx).^2 + (j-cy).^2;
        H(i,j) = exp(-(d.^2)/(2*D0.^2));
    end
end

outf = imf.*H;
out = abs(ifft2(outf));

figure
subplot(131), imshow(im), title('Original Image');
subplot(132), imshow(uint8(outf)), title('Gaussian Filter');
subplot(133), imshow(uint8(out)), title('Filtered Image');
