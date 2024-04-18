function out = interpolatedRed(mosaic, rMat, gMat)
%Input grayMosaic,red Matrix and green Matrix of the Bayer filter in of the
%img
%Output the interpolated red values in the blue matrix
[row, col, ~] = size(mosaic);
out = ones(row,col);

for i=2:2:row-2
    for j=2:2:col-2
        out(i,j) = ((mosaic(i-1,j-1)-gMat(i-1,j-1))+(mosaic(i+1,j+1)-gMat(i+1,j+1))+(mosaic(i-1,j+1)+gMat(i-1,j+1))+(mosaic(i+1,j-1)-gMat(i+1,j-1)))/4+gMat(i,j);
    end
end
out(rMat == 1) = mosaic(rMat == 1); 
end
