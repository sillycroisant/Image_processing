im = imread('hui.jpg');

figure(1);
subplot(221);
imshow(im);
subplot(222);
histogram(im);

imRed = im(:,:,1);
imGreen = im(:,:,2);
imBlue = im(:,:,3);

histRed = histeq(imRed);
histGreen = histeq(imGreen);
histBlue = histeq(imBlue);

eqImg = cat(3, histRed, histGreen, histBlue);

subplot(2,2,3),
imshow(eqImg);

subplot(2,2,4), 
histogram(eqImg);