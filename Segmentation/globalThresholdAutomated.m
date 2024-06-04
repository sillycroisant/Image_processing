clc; close all; clearvars;
%Extract the img
name = 'lena.png';
im = imread(name);
lum = rgb2gray(im);
[row, col] = size(lum);
%Automated Gen threshold value
%Tnow = 6;
%rgb2histogram(name);
Tnow = mean2(lum);
Tlast = 0;
d = 5;
%Automated updated T
while abs(Tnow - Tlast) > d 
    tmp_seg = zeros(size(lum));
    for i=1:row
        for j=1:col
            if(lum(i,j) > Tnow)
                tmp_seg(i,j) = 255;
            end
        end
    end
    figure;
    subplot(121), imshow(im);
    subplot(122), imshow(uint8(tmp_seg)), title(['T : ',num2str(uint8(Tnow))]);
    m1 = uint8(mean2(lum(tmp_seg == 255)));
    m2 = uint8(mean2(lum(tmp_seg == 0)));
    Tlast = Tnow;
    Tnow = uint8((m1+m2)/2);
end