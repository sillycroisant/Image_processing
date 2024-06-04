clc, clear, close;

im = rgb2gray(imread('lena.png'));

w = 3; %windowsize
[row, col] = size(im);
th = zeros(row, col);

for i=1:(w+1):row
    for j=1:(w+1):ol
        local = im(i:i+w-1,j:j+w-1);
        T = graythresh(local);
        local = uint8(imbinarize(local,T));
        im(i:i+w-1,j:j+w-1) = local;
    end
end

figure, imshow(uint8(im));

