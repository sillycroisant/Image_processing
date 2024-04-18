%Bai 11 : Loc anh trong mien tan soo (thong thap li tuong)
%Cho I la anh xam
%Trong mien tan so, goi H la bo loc thong thap co tan so cat D0 = 0.2
%Chu y bien dien tan so trong khoangr [-0.5 , 0.5]
%Hien thi ket qua sau khi loc. Nhan xet
%Thay doi gia tri D0, so sanh ket qua va nhan xet

clc, clearvars, close all;

I = imread('kodim06.png');
%figure
%imshow(I); title('Original Image');

grayI = rgb2gray(I);
S = fft2(double(grayI));

%figure
%imagesc(uint8(log(abs(fftshift(S)+1)))); title('Spectre');

F = zeros(size(S));
[M, N] = size(S);
r = (M+1)/2;
c = (N+1)/2;
[X, Y] = meshgrid(1:N, 1:M);
radius = sqrt((X-c).^2+(Y-r).^2);
D0 = min(N/6,M/6);
F(radius<D0) = 1;
figure
subplot(121), imshow(F,[]); title('Filter');
axis square;

S1 = fftshift(S).*F;
S1 = ifftshift(S1);
I1 = ifft2(S1);
subplot(122), imshow(real(I1),[]); title('Filtered image');


