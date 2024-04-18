function y = greenChanel(I,mG)
[j,k] = size(I); %The size of the input
y = zeros(j,k); %Create a copy of the input
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
figure, imshow(uint8(y)), title('Green');
end

