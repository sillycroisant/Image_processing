clc, close, clearvars;

im = imread('ttss1.jpg');
g = rgb2gray(im);

subplot(241);
imshow(im); title('Color Img');
subplot(242);
imshow(g); title('Grayscale Img')

[row, col, dim] = size(g);

%Lay mau moi 2x2 bit
im2bit = g(1:2:end,1:2:end);

for i=1:1280
    for j=1:1280
        tmp(i,j) = im2bit(ceil(i/2),ceil(j/2));
    end
end

im2bit = tmp;

subplot(243);
imshow(im2bit); title('2x2 bits sample')

%Lay mau moi 3x3 bit
im3bit = g(1:3:end,1:3:end);

for i=1:1280
    for j=1:1280
        tmp(i,j) = im3bit(ceil(i/3),ceil(j/3));
    end
end

im3bit = tmp;

subplot(244);
imshow(im3bit); title('3x3 bits sample')

%Lay mau moi 4x4 bits
im4bit = g(1:4:end,1:4:end);

for i=1:1280
    for j=1:1280
        tmp(i,j) = im4bit(ceil(i/4),ceil(j/4));
    end
end

im4bit = tmp;

subplot(245);
imshow(im4bit); title('4x4 bits sample')

%Lay mau moi 5x5 bits
im5bit = g(1:5:end,1:5:end);

for i=1:1280
    for j=1:1280
        tmp(i,j) = im5bit(ceil(i/5),ceil(j/5));
    end
end

im5bit = tmp;

subplot(246);
imshow(im5bit); title('5x5 bits sample')

%Lay mau moi 6x6 bits
im6bit = g(1:6:end,1:6:end);

for i=1:1280
    for j=1:1280
        tmp(i,j) = im6bit(ceil(i/6),ceil(j/6));
    end
end

im6bit = tmp;

subplot(247);
imshow(im6bit); title('6x6 bits sample')

%Lay mau moi 7x7 bits
im7bit = g(1:7:end,1:7:end);

for i=1:1280
    for j=1:1280
        tmp(i,j) = im7bit(ceil(i/7),ceil(j/7));
    end
end

im7bit = tmp;

subplot(248);
imshow(im7bit); title('7x7 bits sample')
