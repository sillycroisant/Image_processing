clc, close, clearvars;

im = imread('kodim01.png');

I = convertToMosaicImage(im);

figure, subplot(121), imshow(uint8(I));

redFilter = 1/4 * [1 2 1; 2 4 2; 1 2 1];
blueFilter = redFilter;
greenFilter = 1/4 * [0 1 0; 1 4 1; 0 1 0];
I(:,:,1) = conv2(double(I(:,:,1)),double(redFilter),'same');
I(:,:,2) = conv2(double(I(:,:,2)),double(greenFilter),'same');
I(:,:,3) = conv2(double(I(:,:,3)),double(blueFilter),'same');

subplot(122); imshow(uint8(I)), title('Alleyson');