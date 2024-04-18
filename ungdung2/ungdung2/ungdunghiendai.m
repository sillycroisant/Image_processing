function ungdunghiendai
close all;
i = imread('ungdung2.jpg');
i = double(i);
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
f = [ -2 3 -6 3 -2;
    3 4 2 4 3; 
    -6 2 48 2 -6; 
    3 4 2 4 3; 
    -2 3 -6 3 -2] /64;
lum = conv2(jm,f,'same');
figure, imshow(lum,[]);
chr = jm - lum;
chr1 =  chr .* mR;
chr2 =  chr .* mG;
chr3 =  chr .* mB;
fRB = [1 2 1; 2 4 2; 1 2 1]* 1/4;
fG = [0 1 0; 1 4 1; 0 1 0] * 1/4;
chr1 = conv2(chr1,double(fRB),'same');
chr2 = conv2(chr2,double(fG),'same');
chr3 = conv2(chr3,double(fRB), 'same');
chr1 = chr1 + lum; chr2 = chr2 + lum; chr3 = chr3 + lum;
y = zeros(m,n,3);
y(:,:,1) = chr1; y(:,:,2) = chr2; y(:,:,3) = chr3;
figure
subplot(231); imshow(uint8(jc));
title('Multiplexed Image');
subplot(232); imshow(uint8(lum));
title('Luminance');
subplot(233); imshow(uint8(y));
title('rgb image');
subplot(234); imshow(uint8(chr));
title('mul chr');