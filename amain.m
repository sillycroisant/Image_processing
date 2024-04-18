clc, clearvars, close all;

img_name = 'hand.jpg';

d = 50;

image = imread(img_name);

%Low pass filter
lpf_img = ideal_low_pass_filter(img_name, d);

%High pass filter
hpf_img = ideal_high_pass_filter(img_name, d);

%Hybrid img
figure
subplot(131), imshow(image), title('Anh goc');
subplot(132), imshow(uint8(lpf_img)), title('Low pass filted img');
subplot(133), imshow(uint8(hpf_img)), title('High pass filtered img');