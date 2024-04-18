function s = transformation_stretching(r)
L = 256;
r1 = (L/2+L/4)/2;
s1= L/8;
r2 = (L/2+3*L/4)/2; s2 = L - 1 - L/8;

if r < r1
    s = r/r1*s1;
elseif r > r2
    s = s2 + (r-r2)/(L-1-r2)*(L-1-s2);
else
    s = s1 + (r-r1)/(r2-r1)*(s2-s1);
end
