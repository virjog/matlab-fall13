%%18 September 2013

%%-------------------------------------------------------------------------

%%Q1
%%Practice Exercise 3.5
x = [4 90 85 75
2 55 65 75
3 78 82 79
1 84 92 93];

[a,b] = max(a);

a           %%a = 4    90    92    93
b           %%b = 1     1     4     4

[c,d] = max(x');
c           %%c = 90    75    82    93
d           %%d = 2     4     3     4

max(a)      %%ans = 93

%%Practice Exercise 3.6
mean(x)     %%ans = 2.5000   76.7500   81.0000   80.5000
median(x)   %%ans = 2.5000   81.0000   83.5000   77.0000

mean(x')    %%ans = 63.5000   49.2500   60.5000   67.5000
median(x')  %%ans = 80.0000   60.0000   78.5000   88.0000

mode(x)     %%ans = 1    55    65    75
%%When requesting for the mode of matrix x, the lowest value in each column
%%is returned.

mean(mean(x))   %%ans = 60.1875

sum(x)
sum(x')
prod(x)
prod(x')
cumsum(x)
cumsum(x')
cumprod(x)
cumprod(x')

%%Practice Exercise 3.7
size(x)
sort(x)
sort(x, 'descend')
sortrows(x)
sortrows(sortrows(x),-3)

%%Practice Exercise 3.8
std(x)
var(x)
sqrt(var(x))
%%The results from exercise 3 are equivalent to the results from exercise 1
%%as the square root of variance is equal to the standard deviation.

%%-------------------------------------------------------------------------

%%Q2a.
%%method 1
f = @(x) (x.^3 - (6*x));
x = linspace(0,3,200);
[f0,i0] = min(f(x)); x0 = x(i0);
plot(x, f(x), 'b-', x0, f0, 'ro');
title('minimum of x^3 - 6x');
xlabel('x');
ylabel('f(x)');
grid on;
set(gca, 'XTick', 0:1:3);
set(gca, 'YTick', -10:5:10);
legend('f(x) = x^3 - 6x', '(xmin, fmin)');

%%method 2
[x1,f1] = fminbnd(f, 0, 3);

%%method 3
F = @(x)(3*x.^2 - 6);
x2 = fzero(F, 0.5);
f2 = f(x2);
[x0,x1,x2; f0,f1,f2];

%%Although methods 2 and 3 resulted in a minimum equivalent to the square
%%root of 2 to 4 decimal places, the minimum from method 1 can be closer to
%%the true value if more points are plotted.

%%Q2b.
%%method 1
f = @(x) (x.^3 - (6*x));
x = linspace(-3,0,200);
[f0,i0] = max(f(x)); 
x0 = x(i0);
plot(x, f(x), 'b-', x0, f0, 'ro');
title('maximum of x^3 - 6x');
xlabel('x');
ylabel('f(x)');
grid on;
set(gca, 'XTick', -3:1:0);
set(gca, 'YTick', -10:5:10);
legend('f(x) = x^3 - 6x', '(xmax, fmax)');

%%method 2
g = @(x) -f(x);
[x1,gmin] = fminbnd(g, -3, 0);
f1 = -gmin;

%%method 3
F = @(x)(3*x.^2 - 6);
x2 = -fzero(F, .5);
f2 = f(x2);
[x0,x1,x2; f0,f1,f2];

%%Q2c.
f = @(x) (x.^3 - (6*x));
x = linspace(0,3,200);
[f0,i0] = min(f(x)); 
x0 = x(i0);
plot(x, f(x), 'b-', x0, f0, 'rs');

hold on;

f = @(x) (x.^3 - (6*x));
x = linspace(-3,0,200);
[f0,i0] = max(f(x)); 
x0 = x(i0);
plot(x, f(x), 'b-', x0, f0, 'ro');

title('maximum and minimum of x^3 - 6x');
xlabel('x');
ylabel('f(x)');
grid on;
set(gca, 'XTick', -3:1:3);
set(gca, 'YTick', -10:5:10);
legend('f(x) = x^3 - 6x', 'minimum','maximum');
