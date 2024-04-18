%Bai 10. Cho I la anh xam, nhieu muoi tieu (salt&pepper noise) voi ti le p = 0.1 vao anh I,
%thu dc anh I1. Goi H = 1/16[1 2 1; 2 4 2; 1 2 1]
%a, Loc I1 bang H. Hien thi ket qua va so sanh vs I
%b, Dung bo loc Median, kich thuoc 3x3 de loc anh I1. Hien thi ket qua
%c, Thay doi p cua nhieu muoi tieu, p = 0.4. Lam lai cau b. Nhan xet ket
%qua. Neu ket qua ko tot, de xuat cach xu ly
% p = ti le nhieu xuat hien trong anh

im = imread('600800.jpg');
gray_im = rgb2gray(im);
grayImgAddNoise = imnoise(gray_im, 'salt & pepper', 0.4);

H_filter = (1/16*[1 2 1; 2 4 2; 1 2 1]); %Low-pass filter

imgAfterFilter = conv2(double(grayImgAddNoise), double(H_filter),'same');

subplot(221);
imshow(gray_im); title('Origin Img');

subplot(222);
imshow(grayImgAddNoise); title('Img with Salt n Pepper noise');

subplot(223);
imshow(uint8(imgAfterFilter)); title('After Fitler');

medFiltImg = medfilt2(grayImgAddNoise,[3,3]);
subplot(224);
imshow(medFiltImg); title('After Median Filter');

oneMoreTime = medfilt2(medFiltImg);
figure(2);
imshow(oneMoreTime);

twoMoreTime = medfilt2(oneMoreTime);
figure(3);
imshow(twoMoreTime);