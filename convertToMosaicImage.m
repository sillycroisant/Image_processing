function [colorImage] = convertToMosaicImage(I)

I = imread(I);
figure, imshow(I), title('Anh goc');

I = double(I);
[row,column,~] = size(I);
% creating Bayer color filter array (CFA)
% Red
redMatrix = zeros(row,column);
redMatrix(1:2:end,1:2:end) = 1;
% Blue
blueMatrix = zeros(row,column);
blueMatrix(2:2:end,2:2:end) = 1;
% Green
greenMatrix = 1 - redMatrix - blueMatrix;
% mosaicImage
 
mosaicImage = I(:,:,1).*redMatrix + I(:,:,2).*greenMatrix + I(:,:,3).*blueMatrix;
figure, imshow(mosaicImage,[]), title('Mosaice Image');
% colorImage
colorImage = I;
colorImage(:,:,1) = colorImage(:,:,1) .* redMatrix;
colorImage(:,:,2) = colorImage(:,:,2) .* greenMatrix;
colorImage(:,:,3) = colorImage(:,:,3) .* blueMatrix;
figure, imshow(uint8(colorImage)), title('Color Image');