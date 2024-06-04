N = 200;
w = 0:2*pi/N:2*pi;
H = 1 + 2*exp(-j*w) + exp(-2*j*w);
plot(w/pi, abs(H), 'linewidth',2)