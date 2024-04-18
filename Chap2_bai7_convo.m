i = imread('600800.jpg');
g = rgb2gray(i);

figure(1); imshow(g); title('Origin');

figure(2);
h3 = ones(3,3)/9;
aconv = conv2(g,h3,'same');
subplot(221), imshow(uint8(aconv)), title('3x3 Average Filter');

h7 = ones(7,7)/49;
bconv = conv2(g,h7,'same');
subplot(222), imshow(uint8(bconv)), title('7x7 Average Filter');

h9 = ones(9,9)/81;
conv9 = conv2(g,h9,'same');
subplot(223), imshow(uint8(conv9)), title('9x9 Average Filter');

h13 = ones(13,13)/169;
conv13 = conv2(g,h13,'same');
subplot(224), imshow(uint8(conv13)), title('13x13 Average Filter');

%Kich thuoc bo loc cang lon thi do ro net cua anh cang thap -> bo loc thong
%thap co chuc nang loc tang so cao
