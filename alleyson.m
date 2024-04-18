function alleyson
clc, close, clearvars;
I = imread('kodim01.png');
figure, imshow(I), title('Original Img');

I = double(I);
[M,N,~] = size(I);

%tao CFA
%mau do: RxRxR
%        xxxxx
%        RxRxR
mR = zeros(M,N);
mR(1:2:end, 1:2:end) = 1;

%mau Blue xxxxxx
%         xBxBxB
%         xxxxxx
%         xBxBxB
mB = zeros(M,N);
mB(2:2:end,2:2:end) = 1;

%mau Green
mG = 1 - mR - mB;

%Mosaic image / multiplexed image
%Chu y: chi biet Im va mR, mG, mB
Im = I(:,:,1).*mR + I(:,:,2).*mG + I(:,:,3).*mB;
figure, imshow(uint8(Im)), title('What is this');
%duoi dang sau
Ic = I;
Ic(:,:,1) = Ic(:,:,1).*mR;
Ic(:,:,2) = Ic(:,:,2).*mG;
Ic(:,:,3) = Ic(:,:,3).*mB;
figure, imshow(uint8(Ic)), title('CFA mosaic Img');

%yeu cau tu mr,mg,mb va ic/im khoi phuc anh mau 

%pp Alleyson: input Im va mR,mG, mB
%Step 1 : estimating the luminance
FL = [-2 3 -6 3 -2; 3 4 2 4 3; -6 2 48 2 -6; 3 4 2 4 3; -2 3 -6 3 -2]/64;
lum = conv2(Im,FL,'same'); % Lay cuong do sang
figure, imshow(uint8(lum)), title('Luminance Img');

%Step 2 : estimating the chrominance
Chr = Im - lum; %multiplexed chrominance
figure, imshow(uint8(Chr)), title('Chrominance Img');

%Step 3 : de-multiplexing the chrominance
Chr1 = Chr .* mR; %demultiplexing/ subsampling
Chr2 = Chr .* mG;
Chr3 = Chr .* mB;
FR = [1 2 1;2 4 2;1 2 1]/4;
FG = [0 1 0;1 4 1;0 1 0]/4;

%Step 4 : interpolate the opponent chromatic signals
Chr1 = conv2(Chr1, FR,'same'); %interpolation - noi suy
Chr2 = conv2(Chr2, FG,'same');
Chr3 = conv2(Chr3, FR,'same');

%Step 5 : reconstruct the image from luminance and interpolated chromatic
%signals
Chr1 = Chr1 + lum;
Chr2 = Chr2 + lum;
Chr3 = Chr3 + lum;

Y = zeros(M,N,3);
Y(:,:,1) = Chr1;
Y(:,:,2) = Chr2;
Y(:,:,3) = Chr3;

figure, imshow(uint8(Y)), title('Reconstructed Image');