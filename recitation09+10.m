%13 November 2013

%-------------------------------------1-----------------------------------
%Q1a.
%initialize variables
v(1) = 0;
t(1) = 0;
T = 0.001;
C = 0.004;
n = 1;
A = 20;
v(n + 1) = T * (A - C * v(n).^2) + v(n);

while v(n + 1) <= 60    %conventional while loop that iterates until velocity reaches 60mph
    n = n + 1;
    v(n + 1) = T * (A - C * v(n).^2) + v(n);
    n(n) = n;
    t(n) = (n(n) - 1) * T;      %calculate time
end
v(n);
t(n);

%Q1b.
A = -4;
while v(n + 1) > 0      %conventional while loop that iterates until velocity is reduced to 0 
    n = n + 1;
    v(n + 1) = T * (A - C * v(n).^2) + v(n);
    n(n) = n;
    t(n) = (n(n) - 1) * T;      %calculate time
end
v(end) = [];    %remove last value which is greater than 0

plot(t,v,t(4423),v(4423),'ro',t(end),v(end),'rs');
hold on;
plot(t(4423),v,'--');   
axis([0 15 0 80]);      %set axis limits
xlabel('t (sec)');
ylabel('v (mph)');
legend('v(t)','t_{60} = 4.42 sec','t_{stop} = 13.01 sec','Location','Best');

%-------------------------------------2-----------------------------------
%Q2a.
A = [2 -1 2; 1 2 2; 0 -1 4];
b = [-9; 2; -7];
x = A\b;

%Q2bv1.
I = eye(size(A));   %identity matrix
D = diag(diag(A));  %diagonal part of matrix A

B = I - D\A;        %3x3 iteration matrix
c = D\b;            %3x1 vector

rho = max(abs(eig(B))); %check if rho < 1

tol = 10^-10;       %tolerance level 
x0 = [1,1,1]';      
x = x0;
k = 1;

while 1
    xnew = B*x + c;
    if norm(xnew - x) < tol
        break;
    end
    x = xnew;
    k = k + 1;
end

k, x, norm(A*x - b);

%Q2bv2.
X(:,1) = x0;
k = 1;

%forever while loop to save individual iterates x(k) into matrix X
while 1
    X(:,k + 1) = B*X(:,k) + c;
    if norm(X(:,k+1) - X(:,k)) < tol
        break;
    end
    k = k + 1;
end

k, x = X(:,k), norm(A*x - b);
K = 1:k;

%Q2bv3.
x = x0; 
k = 1;
X = x;  %X columns are iterates x(k)      

%while loop to save iterates
while 1
    xnew = B*x + c;
    if norm(xnew - x) < tol
        break;
    end
    x = xnew;
    k = k + 1;
    X = [X, x];
end
xsol = A\b;
k, x, norm(A*x - b);

%generate plot of iterates and its components.
plot(K,X');
xlabel('iteration index, k');
legend('x1 = -2','x2 = 3','x3 = -1','Location','Best');

%Q2c.
p = max(abs(eig(B)));  %calculuate spectral radius
p<1;    %verify p (spectral radius) is less than 1; ans = 1 --> true
