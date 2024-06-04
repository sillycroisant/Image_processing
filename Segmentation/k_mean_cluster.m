clc, close all;
img = imread('coin.jpg');
% Chuyển ảnh thành ma trận 2D các điểm dữ liệu (ví dụ: mỗi điểm dữ liệu là một pixel với 3 kênh màu)
[m, n, ~] = size(img);
X = double(reshape(img, m * n, []));
% Số lượng cụm bạn muốn tạo
K = 3;
% �?p dụng phân cụm K-means
[centroids, idx] = kmeans_clustering(X, K);
% �?ặt mỗi điểm dữ liệu trong cùng một cụm với centroid tương ứng
X_reconstructed = centroids(idx, :);
% Chuyển ma trận dữ liệu sau khi phân cụm thành ảnh
img_reconstructed = uint8(reshape(X_reconstructed, m, n, []));
% Hiển thị ảnh gốc và ảnh sau khi phân cụm
figure;
subplot(1, 2, 1);
imshow(img);
title('origin img');
subplot(1, 2, 2);
imshow(img_reconstructed);
title(sprintf('K mean cluster K = %d', K));


