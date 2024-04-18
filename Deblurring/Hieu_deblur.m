close all;
%bien doi fft roi chia roi ifft

I = imread('plumage.png');
I = double(rgb2gray(I));


figure;
subplot(221); imshow(real(I), []); title('Original Image');
H = double(ones(3,3)/9);
Y = conv2(double(I), double(H), 'same');
freq_Y = fft2(Y);

[row, col] = size(I);

freq_H= fft2(H, row, col);

[freq_H_row, freq_H_col] = size(freq_H);

for i = 1 : freq_H_row
    for j = 1 : freq_H_col
        if freq_H(i, j) == 0
            freq_H(i, j) = 0.0000001;
        end
    end
end

disp(size(freq_Y)); 
disp(size(freq_H));
freq_I = freq_Y ./ freq_H;

I = ifft2(freq_I);

subplot(222); imshow(real(I), []); title('Restored Image');

figure; imshow(freq_H);
