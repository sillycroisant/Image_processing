function out = redOnGreenInBlueLine(mosaic,RedInBlue,green)
%Input the graymosaic img, the interpolated red in blue and green channel
%Out the interpolated red on green grid in blue line
[row,col,~] = size(mosaic);
out = RedInBlue;
size(mosaic)
figure, imshow(uint8(out));

for i=1:2:row
    for j=2:2:col
        out(i,j) = (mosaic(i,j-1)-green(i,j-1)+mosaic(i,j+1)-green(i,j+1))/2 + green(i,j);
    end
end

for i=2:2:row
    for j=1:2:col
        out(i,j) = (mosaic(i,j-1)-green(i,j-1)+mosaic(i,j+1)-green(i,j+1))/2 + green(i,j);
    end
end

figure, imshow(uint8(out));

end
