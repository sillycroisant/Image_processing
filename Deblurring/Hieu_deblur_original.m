close all;
%bien doi fft roi chia roi ifft
I = imread('plumage.png');
I = rgb2gray(I);
I = double(I);

figure;
subplot(221); imshow(real(I), []); title('Original Image');
H = double(ones(3,3) / 9);
Y = conv2(I,H,'same'); %Y in spatial domain
Y_Fourier = fft2(Y); %Y in freq domain

H_Fourier = fft2(H); %H in freq domain

[H_Fourier_rows, H_Fourier_columns] = size(H_Fourier); %Size of H in freq domain

H_Fourier = psf2otf(H_Fourier, size(Y_Fourier));

for i = 1 : H_Fourier_rows
    for j = 1 : H_Fourier_columns
        if H_Fourier(i, j) == 0
            H_Fourier(i, j) = 0.0000001;
        end
    end
end

disp(size(Y_Fourier)); disp(size(H_Fourier));
I_Fourier = Y_Fourier ./ H_Fourier;
I = ifft2(I_Fourier);
subplot(222); imshow(real(I), []); title('Restored Image');

figure; imshow(H_Fourier);