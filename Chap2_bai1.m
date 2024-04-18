clc; close; clearvars;

img = imread('img.png');
grayImg = rgb2gray(img);
double(grayImg);

vmax = double(max(grayImg(:)));
vmin = double(min(grayImg(:)));

[col, row, ~] = size(img);

L = 255;

result = zeros(size(grayImg));

for i=1:col
    for j=1:row
        result(i,j) = ((double(grayImg(i,j)) - vmin) / (vmax - vmin))*L;
    end
end

subplot(221);
imshow(img); title('Img');
subplot(222);
imshow(grayImg); title('Gray Img');
subplot(223);
imshow(uint8(result)); title('Stretched Img');