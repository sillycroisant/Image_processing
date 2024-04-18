function seed_constrast
close all
I = imread('img.png');
I = rgb2gray(I);
I = double(I);
Y = zeros(size(I));
for i=1:size(I,1)
    for j=1:size(I,2)
        Y(i,j) = transformation_stretching(I(i,j));
    end
end
figure, imshow(uint8(I))
figure, imshow(uint8(Y))