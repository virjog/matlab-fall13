%1 November 2013

%--------------------------1-----------------------
%Q1a.
%(1) for loop
N = 100;
S = 0;
for k = 1:N
    S = S + k;
end

%(2) while loop
N = 100;
S = 0;
k = 1;
while k <= N
    S = S + k;
    k = k + 1;
end
    
%(3) forever while loop
N = 100;
S = 0;
k = 1;
while 1
    S = S + k;
    if(k < N)
        k = k + 1;
    else
        break;
    end
end

%(4) vectorized sum function
N = 100;
k = 1:N;
S = sum(k);

%(5) analytical formula
N = 100;
S = 0;
S = 0.5 * N * (N + 1);

%Q1b. 
S = fsum(100,1);

%Q1c.
%using forever while loop + fsum
N = 0;
while 1
    S = fsum(N,1)
    if(S >= 10^5)
        break
    end
    N = N + 1;
end
smallN = N;

%using conventional while loop + fsum
N = 0;
S = 0;
while S < 10^5
    N = N + 1;
    S = fsum(N);
end
smallN = N;
%--------------------------2-----------------------
%Q2a.
tol = 10^-10;
x(1) = 1;
k = 1;
k0 = [0];

while 1
    k0(k+1) = k;
    x(k + 1) = exp(-x(k));
    if abs(x(k) - x(k + 1)) < tol
        break;
    end
    k = k + 1;
end
k0(k+1) = k;

plot(k0,x,k0(k+1),x(k+1),'ro');
axis([0,50,0.2,1.0]);
xlabel('iterations, \itk');
ylabel('{\itx}({\itk})');

%Q2b.
tol = 10^-10;
x(1) = 1;
k = 1;
k0 = [0];
diff = false;

while diff == false;
    k0(k) = k;
    x(k + 1) = exp(-x(k));
    if  abs(x(k) - x(k + 1)) < tol
        diff = true;
    end
    k = k + 1;
end
k0(k) = k;
plot(k0,x,k0(k),x(k),'ro');
axis([0,50,0.2,1.0]);
xlabel('iterations, \itk');
ylabel('{\itx}({\itk})');

%Q2c.
format long;
a = 0;
i = 0;
tol = 10^-9;

while 1
    a = fzero(@(x)(x*exp(x) - 1), i);
    if abs(a - 0.56714329) <= tol
        break;
    end
    i = i + 0.01
end
disp(a);

%Q2d.
a = 0:2;
y = a;
y1 = exp(-a);
t = 1:length(a);
tt = linspace(t(1),t(end),1001);
xx = spline(t,a,tt);
yy = spline(t,exp(-a),tt);
b = find(abs(xx - yy) < 10^-2);
xavg = mean(xx(b));
yavg = mean(yy(b));
plot(a,y,'-b',xx,yy,'-b',xavg,yavg,'ro');

%--------------------------3-----------------------
%Q3a.
f = @(k)(k.^2 ./ 2.^k);
k = 1:50;
t = 1:length(k);
tt = linspace(t(1),t(end),1001);
xx = spline(t,k,tt);
yy = spline(t,f(k),tt);
plot(xx,yy,'b-')
axis([0,50,0,1.4]);
xlabel('x');
ylabel('f(x)');

tol = 10^-10;
for i = 1:2000
    a = fzero(@(k)(k.^2 ./ 2.^k) - tol, i);
end
iteration = ceil(a);

%Q3b.
S(1) = 0.5;
k = 2;
k0 = 0;
tol = 10^-10;

%forever while loop to calculate S(k) + determine # of iterations, k
while 1
    k0(k-1) = k;
    S(k) = S(k - 1) + (k.^2 ./ 2.^k);
    if abs(S(k) - S(k - 1)) <= tol
        break;
    end
    k = k + 1;
end
k0(k) = k;
plot(k0,S,k,S(k),'ro',45,6,'r.');
axis([0,50,0,7]);
grid on;
xlabel('iterations, k');
ylabel('S(k)');
legend('S(k)','computed','exact','Location','SouthEast');

%plot approximation error
semilogy(k0,abs(S(k0) - 6));
axis([0,50,0,10^0]);
grid on;
xlabel('iterations, k');
ylabel('error, E(k)');


%Q3c.
S(1) = 0.5;
K = 2;
K0 = 2;
tol = 10^-10;
S(K) = S(K - 1) + (K.^2 ./ 2.^K);

%conventional while loop to calculate S(k) + determine # of iterations, k
while abs(S(K) - S(K-1)) > tol
    K = K + 1;
    K0(K-1) = K;
    S(K) = S(K - 1) + (K.^2 ./ 2.^K);
end
K0(K) = K;
plot(K0,S,K,S(K),'ro',45,6,'r.');
axis([0,50,0,7]);
grid on;
xlabel('iterations, k');
ylabel('S(k)');
legend('S(k)','computed','exact','Location','SouthEast');

%compare the values of k
K == k; %ans = 1 -> true;

%Q3d.
%like part b
k = 2;
S(1) = 0.5;
tol = 10^-12;

%forever while loop
while 1
    Sold = S(k - 1);
    S(k) = S(k - 1) + (k.^2 ./ 2.^k);
    if abs(Sold - S(k)) <= tol
        break;
    end
    k = k + 1;    
end
disp(k);
E = abs(S(k) - 6);
disp(E);

%like part c
k = 2;
S(1) = 0.5;
tol = 10^-12;
Sold = S(1);
S(k) = S(k - 1) + (k.^2 ./ 2.^k);

%conventional while loop
while abs(Sold - S(k)) > tol
    Sold = S(k);
    k = k + 1;
    S(k) = S(k - 1) + (k.^2 ./ 2.^k);
end
disp(k);
E = abs(S(k) - 6);
disp(E);
