clc, clear, close;

M = 15000;
N = 10000;
D = 100;

x1 = randn(M,D);
x2 = randn(N,D);

d = zeros(M,N);

f = @date;

%{
for i=1:M
    for j=1:N
        dis = 0;
        for k=1:D
            dis = dis + (x1(i,k) - x2(j,k))^2;
        end
        d(i,j) = sqrt(dis);
    end
end
%}

x12 = sum(x1.^2,2);
x22 = sum(x2.^2,2);

dd = x12*ones(1,N) + ones(M,1)*x22' - 2*x1*x2';

t = timeit(f);

    