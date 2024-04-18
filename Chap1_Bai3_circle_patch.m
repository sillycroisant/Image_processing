%[Bai 3]: them tinh nang lay patch duong tron
function Bai3_circle_patch
I = imread('hui.jpg');

I = im2double(I);

[M,N,~] = size(I);

r = 100; %Radius
k = zeros(M+2*r,N+2*r,3); %Edge filler
k (r+1:r+M, r+1:r+N, :) = I; % Add Origin Image to Filler Edges
J = k; % Duplicate of Origin Image with Filler Edges 

[m,n,~] = size(k); % Take stats

% Patch P
i = floor(random('unif',1+r,M+1+r));
j = floor(random('unif',1+r,N+1+r));

% Patch Q
p = k(i-r:i+r, j-r:j+r,:);
q = k(m-i-r:m-i+r,n-j-r:n-j+r,:);
P=p;


p = patchCircular(p,q,r);
q = patchCircular(q,P,r);

k(i-r:i+r, j-r:j+r,:) = q;
k(m-i-r:m-i+r,n-j-r:n-j+r,:) = p;

figure
subplot(221);
imshow(p);
title('patch p')
set(gca,'Visible','on');

subplot(222);
imshow(q);
title('patch q')
set(gca,'Visible','on');

subplot(223);
imshow(J);
title('anh goc')
set(gca,'Visible','on');

subplot(224);
imshow(k);
title('anh hoan vi')
set(gca,'Visible','on');
end

function [i] = patchCircular(a,b,r)
i = zeros(size(a));
[m,n,~] = size(a);
[xx,yy] = ndgrid((1:m)-m/2, (1:n)-n/2);
mask = (xx.^2 + yy.^2)< r^2;
i(:,:,1) = a(:,:,1).*mask;
i(:,:,2) = a(:,:,2).*mask;
i(:,:,3) = a(:,:,3).*mask;

%fix black outside patchCircular
mask = (xx.^2 + yy.^2)>= r^2;
i(:,:,1) = i(:,:,1) + b(:,:,1).*mask;
i(:,:,2) = i(:,:,2) + b(:,:,2).*mask;
i(:,:,3) = i(:,:,3) + b(:,:,3).*mask;
end


