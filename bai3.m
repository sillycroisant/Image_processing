function bai3
close all;
i = imread('test.png');
i = double(i); %Original image
[row,col,~] = size(i); %Size of the image

%tao CFA mau do: [ RxRx , xxxx, RxRx]
%Red matrix
mR = zeros(row,col);
mR(1:2:end,1:2:end) = 1;
%Blue matrix
mB = zeros(row,col);
mB(2:2:end,2:2:end) = 1;
%Green matrix
mG = 1 - mR - mB;

jm = i(:,:,1).*mR + i(:,:,2).*mG + i(:,:,3).*mB; %Grayscale mosaic
jc = i;
jc(:,:,1) = jc(:,:,1).*mR;
jc(:,:,2) = jc(:,:,2).*mG;
jc(:,:,3) = jc(:,:,3).*mB; %Color mosaic
figure
subplot(131); imshow(uint8(i)), title('Anh goc');
subplot(132); imshow(uint8(jm)), title('Gray mosaic');
subplot(133); imshow(uint8(jc)), title('Color mosaic');

green = zeros(row,col);
blue = green;
red = blue;
green = greenChanel(jm,mG);
%figure, imshowpair(uint8(i(:,:,2)),uint8(green),'montage');
%y = zeros(row,col,3);
%y(:,:,1) = red;
%y(:,:,2) = green;
%y(:,:,3) = blue;
%figure
%subplot(221); imshow(uint8(i)); title('anh goc');
%subplot(222); imshow(uint8(jm)); title('anh mosaic thuc te');
%subplot(223); imshow(uint8(jc)); title('anh mosaic mau');
%subplot(224); imshow(uint8(y)); title('anh demosaic');

new_img = interpolatedRed(jm,mR,green);
figure, imshow(uint8(new_img)), title('interpolated Red on Blue');

redOnGreenInBlueLine(jm,new_img,green);

end

