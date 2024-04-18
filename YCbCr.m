im = imread('hui.jpg');
L = rgb2gray(im);
figure
subplot(221), imshow(im);
subplot(223), imhist(L), title('origin');
% separate the luminance component from chrominance components
Y = rgb2ycbcr(im);
% equalize this luminance
Y1 = Y(:,:,1);
Y1 = histeq(Y1);
% - reconstruct a color image
Y(:,:,1) = Y1;
Y = ycbcr2rgb(Y);
%Show results
LY = rgb2gray(Y);
subplot(222), imshow(Y);
subplot(224), imhist(LY);
