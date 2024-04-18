function  [fft_img, phase]= ampFreq(img)
%Take an image or 2-d datas 
%Then turn it to gdrayscale image
gray_img = rgb2gray(img);

%Then apply a Fourier transform to that gray  image
fft_img = fft2(gray_img);

%Then shift the image to the center
fft_img = fftshift(fft_img);

%Adjust to better visualize it as an output of amp freq
phase = uint8(2*log(abs(fft_img)+1));
end
