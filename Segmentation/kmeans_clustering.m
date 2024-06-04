function [centroids, idx] = kmeans_clustering(X, K)
    % Khởi tạo các centroids ngẫu nhiên
    [n, m] = size(X);
    centroids = X(randperm(n, K), :);
    idx = zeros(n, 1);
    prev_idx = idx;
    % Lặp cho đến khi hội tụ
    while true
        % Bước 2: Gán mỗi điểm dữ liệu vào cụm gần nhất
        for i = 1:n
            distances = sqrt(sum((centroids - X(i, :)).^2, 2));
            [~, idx(i)] = min(distances);
        end
        % Bước 3: Tính lại centroid cho mỗi cụm
        for k = 1:K
            centroids(k, :) = mean(X(idx == k, :), 1);
        end
        % Kiểm tra sự hội tụ
        if isequal(prev_idx, idx)
            break;
        else
            prev_idx = idx;
        end
    end
end