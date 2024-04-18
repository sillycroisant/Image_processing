function sosanh
close all;
i = imread('kodim19.png');
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
yhiendai = hiendai(jm, mR, mB, mG);
ytruyenthong = truyenthong(jc);
psnrTT = psnr(ytruyenthong,i)
ssimTT = ssim(ytruyenthong,i)
psnrHD = psnr(yhiendai,i)
ssimHD = ssim(yhiendai,i)
figure,
subplot(221); imshow(uint8(jc));
title('mosaic image');
subplot(222); imshow(uint8(jm));
title('mosaic image real');
subplot(223); imshow(uint8(yhiendai));
title('hien dai');
subplot(224); imshow(uint8(ytruyenthong));
title('truyenthong');
figure
imshowpair(uint8(yhiendai), uint8(ytruyenthong), 'montage');
end

function y = hiendai(jm,mR,mB,mG)
[m,n,~] = size(jm);
f = [ -2 3 -6 3 -2;
    3 4 2 4 3; 
    -6 2 48 2 -6; 
    3 4 2 4 3; 
    -2 3 -6 3 -2] /64;
lum = conv2(jm,f,'same');
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
end

function y = truyenthong(jc)
fRB = [1 2 1; 2 4 2; 1 2 1]* 1/4;
fG = [0 1 0; 1 4 1; 0 1 0] * 1/4;
yR = conv2(double(jc(:,:,1)),double(fRB));
yG = conv2(double(jc(:,:,2)),double(fG));
yB = conv2(double(jc(:,:,3)),double(fRB));
[m,n] = size(yR);
y = jc;
y(:,:,1) = yR(2:m-1,2:n-1);
y(:,:,2) = yG(2:m-1,2:n-1);
y(:,:,3) = yB(2:m-1,2:n-1);
end