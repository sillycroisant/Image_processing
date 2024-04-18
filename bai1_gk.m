function bai1_gk
close all;
ic = imread('plumage.png');
i = double(rgb2gray(ic));
tic; % Start the timer
h = [1 2 4 2 1]/10;
i1 = conv2(i,h,'same');
i2 = conv2(i1,h','same');
elapsedTime = toc; % Read the elapsed time
disp(['Elapsed time: ', num2str(elapsedTime), ' seconds']);
tic; % Start the timer
H = [ 1 2 4 2 1;
      2 4 8 4 2;
      4 8 16 8 4;
      2 4 8 4 2;
      1 2 4 2 1;] /100;
i3 = conv2(i,H,'same');
elapsedTime = toc; % Read the elapsed time
disp(['Elapsed time: ', num2str(elapsedTime), ' seconds']);
fi = fft2(i);
fi = fftshift(fi);
amplitudeFi = 2*log(abs(fi) + 1);
figure, imshow(ic), title('Color img');
figure, imagesc(amplitudeFi), title('Amplitude Spectrum');
[row, col] = size(amplitudeFi);

uv = zeros(row,col);
uv(row/2-5:row/2+5,col/2-5:col/2+5) = amplitudeFi(row/2-5:row/2+5,col/2-5:col/2+5);
figure, imagesc(uv), title('UV');

figure;
subplot(221);
imshow(uint8(i)), title('Gray Img');
subplot(222);
imshow(uint8(i2));
subplot(223);
imshow(uint8(i3));
