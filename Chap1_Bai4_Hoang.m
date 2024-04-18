%[B?i 4]: Goi I l? mot anh x?m/m?u. 
%Goi Y l? anh duoc tao ra nhu sau Y = I+N,
%voi N c? c?ng k?ch thuoc voi I v? N l? nhieu Gaussian c? mean
%m = 0 v? standard deviation std = 5. Hien thi I v? Y.
%Tinh mean v? std cua I. T?nh mean v? std cua Y.
%Cat mat patch bat k? k?ch thuoc 10x10 tu ), 
%sau d? t?nh mean v? std cua patch n?y. 
%Thuc hien lai voi Y (ch? ? patch tu I v? Y deu duoc lay
%tu c?ng toa d?). Nhan x?t

function Bai4_Hoang
i = imread('hui.jpg'); % read your image
i = im2double(i); % convert image to double precision
% im2double chuyen ve 0 va 1 nen noise very small


% Create Gaussian noise
N = numel(i); % number of elements in the image
mean = 0; % mean of your noise
sd = 5; % standard deviation of your noise
noise = mean + sd*randn([1, N]); % create Gaussian noise

% Reshape the noise to match the image dimensions
noise = reshape(noise, size(i));

% Add noise to the image
y = i + noise;

[iMean, iSd] = calMeanSd(i);
fprintf('%s\n','mean of i:');
disp(iMean);
fprintf('%s\n','Standard deviation of i:');
disp(iSd);

[yMean, ySd] = calMeanSd(y);
fprintf('%s\n','mean of y:');
disp(yMean);
fprintf('%s\n','Standard deviation of y:');
disp(ySd);

%lay patch 10x10
[m,n,~] = size(i);
I = floor(random('unif',11,m - 10));
J = floor(random('unif',11,n-10));

p = i(I-10:I+10, J-10:J+10,:);
q = y(I-10:I+10, J-10:J+10,:);

[pMean, pSd] = calMeanSd(p);
fprintf('%s\n','mean of p from original image:');
disp(pMean);
fprintf('%s\n','Standard deviation of p from orginal image:');
disp(pSd);

[qMean, qSd] = calMeanSd(q);
fprintf('%s\n','mean of q from noise image:');
disp(qMean);
fprintf('%s\n','Standard deviation of q from noise image:');
disp(qSd);

% Display the original and noisy images
figure;
subplot(221);
imshow(i);
title('Original Image');

subplot(222);
imshow(y);
title('Image with Gaussian Noise');

subplot(223);
imshow(p);
title('patch anh goc 10x10');

subplot(224);
imshow(q);
title('patch anh nhieu 10x10');

end

function [ mean, sd] = calMeanSd(I)
[m,n,k] = size(I);
mean = sum(sum(sum(I)))/(m*n*k);

sd = 0;
for i = 1:m
    for j = 1:n
        for p = 1:k
            sd = sd + (I(i,j,p)-mean)^2;
        end
    end
end

sd = sqrt(sd/(m*n*k));
end