clc; close all; clearvars;
%Extract the illuminance
im = imread('orange.jpg');
lum = im(:,:,2); 
[row, col] = size(lum);
%Plot the histogram and assess the threshold value
figure;
histogram(lum); 
T = 230;
%Segment
seg = zeros(size(lum));
for i=1:row
    for j=1:col
        if(lum(i,j) > T)
            seg(i,j) = 255;
        end
    end
end
%The output resultdepend on the uniformity of lighting
figure;
subplot(121), imshow(rgb2gray(im)), title('origin img');
subplot(122), imshow(uint8(seg)), title('segment img');