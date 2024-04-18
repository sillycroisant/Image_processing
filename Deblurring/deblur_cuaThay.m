%function inverse_filtering
close all
I = imread('a5.jpg');
I = double(rgb2gray(I));
k = 1; %filter size
H = ones(2*k+1,2*k+1)/((2*k+1)^2);

Y = conv2(I,H); %blurred img
sigma = 1; %std
Y = Y + sigma*randn(size(Y));
Ys = fft2(Y);

Hs = fft2(H, size(Ys,1), size(Ys,2)); %spectrum of the filter
H1 = zeros(size(Ys));
H1(1:3,1:3) = H;
Hs = fft2(H1);

eps = 1e-6;
I1s = Ys./(Hs+eps);
I1 = ifft2(I1s);

I1 = I1(1:size(I,1), 1:size(I,2));

figure
subplot(131), imshow(I,[]), title('original');
subplot(132), imshow(Y, []), title('blurred img');
subplot(133), imshow(real(I1),[]), title('reconstructed img');

%end
