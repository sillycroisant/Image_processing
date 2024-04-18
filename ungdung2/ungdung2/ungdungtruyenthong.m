function ungdungtruyenthong
close all;
i = imread('ungdung2.jpg');
i = double(i);
fRB = [1 2 1; 2 4 2; 1 2 1]* 1/4;
fG = [0 1 0; 1 4 1; 0 1 0] * 1/4;
[m,n,~] = size(i);
%tao CFA mau do: [ RxRx , xxxx, RxRx]
mR = zeros(m,n);
mR(1:2:end,1:2:end) = 1;
mB = zeros(m,n);
mB(2:2:end,2:2:end) = 1;
mG = 1 - mR - mB;
jm = i(:,:,1).*mR + i(:,:,2).*mG + i(:,:,3).*mB;
jc = i;
jc(:,:,1) = jc(:,:,1).*mR;
jc(:,:,2) = jc(:,:,2).*mG;
jc(:,:,3) = jc(:,:,3).*mB;
figure
subplot(131); imshow(uint8(i));
subplot(132); imshow(uint8(jm));
subplot(133); imshow(uint8(jc));
yR = conv2(double(jc(:,:,1)),double(fRB));
yG = conv2(double(jc(:,:,2)),double(fG));
yB = conv2(double(jc(:,:,3)),double(fRB));
[m,n] = size(yR);
y = i;
y(:,:,1) = yR(2:m-1,2:n-1);
y(:,:,2) = yG(2:m-1,2:n-1);
y(:,:,3) = yB(2:m-1,2:n-1);
figure,
subplot(121); imshow(uint8(jc));
title('multiplex image');
subplot(122); imshow(uint8(y));
title('rgb imgae');
