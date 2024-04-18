i = imread('img.png');
g = rgb2gray(i);

gaus_noise = normrnd(0,5,size(g));
h = uint8([1 2 1; 2 4 2; 1 2 1]/16);
i1 = g + uint8(gaus_noise);

subplot(121), imshow(g), title('Origin');

out_a = conv2(i1,h,'same');
subplot(122), imshow(uint8(out_a));
title('Image through H filter');

figure(1);
imshow(i1);

