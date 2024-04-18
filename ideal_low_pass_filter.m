function filtered_img = ideal_low_pass_filter(im, d)

img = imread(im);

gray_img = rgb2gray(img);

[f_img , ampfreq] = ampFreq(img);

[m,n] = size(gray_img);
[x,y] = meshgrid(1:n, 1:m);
z = sqrt((x-n/2).^2 + (y-m/2).^2); 
h = z<d; %Vary this variable to adjust the filter mask
lp_filter= h.*f_img; % The low pass filter

filtered_img = ifft2(ifftshift(lp_filter));

%figure
%subplot(221), imshow(gray_img), title('Original Image');
%subplot(222), imagesc(uint8(ampfreq)), title('Image in Frequency domain');
%subplot(223), imshow(2*log(abs(lp_filter)+1)), title('Low pass filter');
%subplot(224), imshow(uint8(abs(filtered_img))), title('Image after low-pass filtered');


figure
subplot(131), imshow(gray_img), title('Origin Img');
subplot(132), imshow(2*log(abs(lp_filter)+1)), title('Low pass filter');
subplot(133), imshow(uint8(filtered_img)), title('ILPF Img');

%hh = z>100;
%hp_filter = hh.*f_img;
%hp_img = ifft2(ifftshift(hp_filter));
%figure, imshow(uint8(abs(hp_img)));
end
