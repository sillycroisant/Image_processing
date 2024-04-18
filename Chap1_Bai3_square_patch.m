clearvars; close; clc;

img = imread('hui.jpg');

figure; imshow(img); title('Origin');

diameter = 20;
rad = ceil(diameter / 2);
[col, row, ~] = size(img);

ax = randi([0,row],1,1);
ay = randi([0,col],1,1);

bx = col - ax;
by = row - ay;

new_img = uint8(zeros(row+diameter, col+diameter,3));
new_img(rad+1:col+rad,rad+1:row+rad,:) = img(1:end,1:end,:);

temp1 = new_img(ax-rad:ax+rad, ay-rad:ay+rad, :);
new_img(ax-rad:ax+rad, ay-rad:ay+rad,:) = new_img(bx-rad:bx+rad, by-rad:by+rad,:);
new_img(bx-rad:bx+rad, by-rad:by+rad,:) = temp1;

img = new_img(rad+1:col+rad,rad+1:row+rad,:);

figure; imshow(img); title('Swapped');
