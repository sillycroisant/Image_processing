function [ori_img, color_mosaic] = cfa(I);
%Take in one input : an image
%Return two outputs : an original img and an its CFA version
%Remember to use uint8() to get the best version of the img 
im = imread(I); %Read the img
ori_img = im;
im = double(im); %Convert it to double-type data

[row, col, ~] = size(im); %Take the parameters about size of img
%Create color filter array CFA
%Red
redMatrix = zeros(row,col);
redMatrix(1:2:end,1:2:end) = 1;

%Blue
blueMatrix = zeros(row,col);
blueMatrix(2:2:end,2:2:end) = 1;

%Green
greenMatrix = 1 - redMatrix - blueMatrix;

%Mosaic img
mosaic_img = im(:,:,1).*redMatrix + im(:,:,2).*blueMatrix + im(:,:,3).*greenMatrix;

size(mosaic_img)

color_mosaic = im;
color_mosaic(:,:,1) = color_mosaic(:,:,1).*redMatrix;
color_mosaic(:,:,2) = color_mosaic(:,:,2).*greenMatrix;
color_mosaic(:,:,3) = color_mosaic(:,:,3).*blueMatrix;
imshow(uint8(color_mosaic));

