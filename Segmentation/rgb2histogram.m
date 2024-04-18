function rgb2histogram(img)
im = imread(img);
gim = rgb2gray(im);
subplot(241), imshow(gim), title('origin img');
subplot(242), imshow(im(:,:,1)), title('red layer');
subplot(243), imshow(im(:,:,2)), title('green layer');
subplot(244), imshow(im(:,:,3)), title('blue layer');
subplot(245), histogram(gim), title('img histogram');
subplot(246), histogram(im(:,:,1)), title('red layer histogram');
subplot(247), histogram(im(:,:,2)), title('green layer histogram');
subplot(248), histogram(im(:,:,3)), title('blue layer histogram');
end
