function Bilinear_interpolation_demosaic(img)

[ori_img, I] = cfa(img);

size(ori_img)
size(I)

subplot(121), imshow(uint8(ori_img)), title('Original Img'); %Color mosaic

redFilter = 1/4 * [1 2 1; 2 4 2; 1 2 1];
blueFilter = redFilter;
greenFilter = 1/4 * [0 1 0; 1 4 1; 0 1 0];

I(:,:,1) = conv2(double(I(:,:,1)),double(redFilter),'same'); %Layer 1
I(:,:,2) = conv2(double(I(:,:,2)),double(greenFilter),'same');
I(:,:,3) = conv2(double(I(:,:,3)),double(blueFilter),'same');

subplot(122); imshow(uint8(I)), title('Bilinear Interpolation Demosaiced Img'); 