clc, close, clear;

name = 'lena.png';
im = rgb2gray(imread(name));

[row,col] = size(im);

%Integral sum
int_sum = double(im);

for i=2:row
    int_sum(i,1) = int_sum(i,1) + int_sum(i-1,1);
end

for j=2:col
    int_sum(1,j) = int_sum(1,j) + int_sum(1,j-1);
end

for i=2:row
    for j=2:col
        int_sum(i,j) = int_sum(i,j) + int_sum(i-1,j) + int_sum(i,j-1) - int_sum(i-1,j-1);
    end
end

%Local sum
w = 3; %Window size
c = round(w/2); %Half a window size
xr = length(row-c


figure, 
subplot(121), imshow(im), title('Origin');
subplot(122), imshow(int_sum), title('Threshold');