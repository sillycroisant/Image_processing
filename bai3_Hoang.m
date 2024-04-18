function bai3_Hoang
close all;

i = imread('test.jpg');
i = double(i);
[m,n,~] = size(i);

%tao CFA mau do: [ RxRx , xxxx, RxRx]
%Red Matrix
mR = zeros(m,n);
mR(1:2:end,1:2:end) = 1;

%Blue Matrix
mB = zeros(m,n);
mB(2:2:end,2:2:end) = 1;

%Green Matrix
mG = 1 - mR - mB;

%Gray Mosaic
jm = i(:,:,1).*mR + i(:,:,2).*mG + i(:,:,3).*mB;

%Color Mosaic
jc = i;
jc(:,:,1) = jc(:,:,1).*mR;
jc(:,:,2) = jc(:,:,2).*mG;
jc(:,:,3) = jc(:,:,3).*mB;
figure
subplot(131); imshow(uint8(i)), title('Anh goc');
subplot(132); imshow(uint8(jm)), title('Gray Mosaic');
subplot(133); imshow(uint8(jc)), title('Color Mosaic');

green = zeros(m,n);
blue = green;
red = green;
green = greenChanel(jm,mG);
figure, imshowpair(uint8(i(:,:,2)),uint8(green),'montage');
red = redChanel(jm,mR,green,mB);
figure, imshowpair(uint8(i(:,:,1)),uint8(red),'montage');
blue = blueChanel(jm,mB,green,mR);
figure, imshowpair(uint8(i(:,:,3)),uint8(blue),'montage');
y = zeros(m,n,3);
y(:,:,1) = red;
y(:,:,2) = green;
y(:,:,3) = blue;
figure
subplot(221); imshow(uint8(i)); title('anh goc');
subplot(222); imshow(uint8(jm)); title('anh mosaic thuc te');
subplot(223); imshow(uint8(jc)); title('anh mosaic mau');
subplot(224); imshow(uint8(y)); title('anh demosaic');
end

function y = greenChanel(I,mG)
[j,k] = size(I);
y = zeros(j,k);
for m = 3:j-2
    for n = 3:k-2
        if(mG(m,n) == 0)
        deltaH = abs((I(m-2,n)+I(m+2,n))/2-I(m,n));
        deltaV = abs((I(m,n-2)+I(m,n-2))/2-I(m,n));
        if round(deltaH-deltaV)<0
            y(m,n)= (I(m-1,n)+I(m+1,n))/2;
        elseif round(deltaH-deltaV)>0
            y(m,n)= (I(m,n-1)+I(m,n-1))/2;
        else
            y(m,n)= (I(m-1,n)+I(m+1,n)+I(m,n-1)+I(m,n-1))/4;
        end
        end
    end
end
%y(1:end,1:2) = y(3,3);
%y(1:2,1:end) = y(3,3);
%y(j-3:end,k-3:end) = y(j-2,k-2);
%y(1:end,k-3:end) = y(j-2,k-2);
y(mG==1) = I(mG==1);
end

function y = redChanel(I,mR,gC,mB)
[j,k] = size(I);
y = zeros(j,k);
for m = 2:j-1
    for n = 2:k -1
        if(mB(m,n) == 1)
        y(m,n) = ((I(m-1,n-1)-gC(m-1,n-1))+(I(m+1,n-1)-gC(m+1,n-1))+(I(m+1,n+1)+gC(m+1,n+1))+(I(m-1,n+1)-gC(m-1,n+1)))/4+gC(m,n);
        end
    end
end

for m = 2:j-1
    for n = 3:k-1
        if(mB(m,n) == 0)
        y(m,n) = ((I(m,n-1)-gC(m,n-1))+(I(m,n+1)-gC(m,n+1)))/2+gC(m,n);
        end
    end
end

for m = 3:j-1
    for n = 2:k-2
        if(mR(m,n) == 0)
        y(m,n) = ((I(m-1,n)-gC(m-1,n))+(I(m+1,n)-gC(m+1,n)))/2+gC(m,n);
        end
   end
end

y(mR==1) = I(mR==1);
end

function y = blueChanel(I,mR,gC,mB)
[j,k] = size(I);
y = zeros(j,k);
for m = 2:j-1
    for n = 2:k -1
        if(mB(m,n) == 1)
        y(m,n) = ((I(m-1,n-1)-gC(m-1,n-1))+(I(m+1,n-1)-gC(m+1,n-1))+(I(m+1,n+1)+gC(m+1,n+1))+(I(m-1,n+1)-gC(m-1,n+1)))/4+gC(m,n);
        end
    end
end

for m = 2:j-1
    for n = 3:k-1
        if(mB(m,n) == 0)
        y(m,n) = ((I(m,n-1)-gC(m,n-1))+(I(m,n+1)-gC(m,n+1)))/2+gC(m,n);
        end
    end
end

for m = 3:j-1
    for n = 2:k-2
        if(mR(m,n) == 0)
        y(m,n) = ((I(m-1,n)-gC(m-1,n))+(I(m+1,n)-gC(m+1,n)))/2+gC(m,n);
        end
   end
end

y(mR==1) = I(mR==1);
end


