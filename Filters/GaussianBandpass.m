function [img, sp] = GaussianBandpass(D0, k, spec)
[img , sk] = Gaussian(D0, spec);
[img, sk_1] = Gaussian(D0 - k, spec);
sk = sk - sk_1;
img = real(ifft2(ifftshift(sk)));
end;