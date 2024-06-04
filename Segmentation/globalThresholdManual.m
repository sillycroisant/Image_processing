clc; close all; clearvars;
%Extract the illuminance
im = imread('orange.jpg');
lum = rgb2gray(im);     
[row, col] = size(lum);
%Plot the histogram and assess the threshold value
figure;
histogram(lum), title('histogram');
T = 180;
%Segment
seg = zeros(size(lum));
for i=1:row
    for j=1:col
        if(lum(i,j) > T)
            seg(i,j) = 255;
        end
    end
end
figure;
subplot(121), imshow(im), title('color img');
subplot(122), imshow(uint8(seg)), title('segment img');