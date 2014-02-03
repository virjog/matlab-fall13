%%2 October 2013

%%---------------------------------Q1------------------------------------.
%%Exercise 5.1
figure;
f = @(x)(sin(x));
x = [0:0.1*pi:2*pi];
y = f(x);
plot(x,y,'b-');
xlabel('x');
ylabel('y');
grid on;
title('y = sin(x)');

figure;
f2 = @(x)(cos(x));
y2 = f2(x);
plot(x,y,'b-');
hold on;
plot(x,y2,'b-');
title('y = sin(x) and y = cos(x)');
xlabel('x');
ylabel('y');

figure;
plot(x,y,'r--');
hold on;
plot(x,y2,'g:');
title('y = sin(x) and y = cos(x)');
xlabel('x');
ylabel('y');
legend('y1 = sin(x)', 'y2 = cos(x)');
set(gca, 'XTick', -1:1:2*pi + 1);
set(gca, 'YTick', -1.5:0.5:1.5);

figure;
x = [0:0.1*pi:2*pi];
a = cos(x);
plot(a);

figure;
plot(x,a);

%%The plots are essentially the same differing only in the x-values of the
%%x-axis.

%%Exercise 5.2
x = [-1.5:0.1:1.5];         %%define values of x from -1.5 to 1.5 inclusive

subplot(2,1,1);             %%subdivide figure window into 2 rows and 2 cols
plot(x,tan(x));             %%plot tan(x) versus x

title('y = tan(x)');        %%title
xlabel('x');                %%label x-axis
ylabel('y');                %%label y-axis

subplot(2,1,2);             %%bottom of the figure window
plot(x,sinh(x));            %%plot sinh(x) versus x

title('y = sinh(x)');       %%title
xlabel('x');                %%label x-axis
ylabel('y');                %%label y-axis

subplot(1,2,1);             %%subdivide figure window vertically 
plot(x,tan(x));             %%plot tan(x) versus x

title('y = tan(x)');        %%title
xlabel('x');                %%label x-axis
ylabel('y');                %%label y-axis

subplot(1,2,2);             %%rightside of the figure window
plot(x,sinh(x));            %%plot sinh(x) versus x

title('y = sinh(x)');       %%title
xlabel('x');                %%label x-axis
ylabel('y');                %%label y-axis

%%Exercise 5.4
x = linspace(1,100,10);
y = 5.*x + 3;
    subplot(2,2,1);
    plot(x,y);
    grid on;

    subplot(2,2,2);
    semilogx(x,y);
    grid on;

    subplot(2,2,3);
    semilogy(x,y);
    grid on;

    subplot(2,2,4);
    loglog(x,y);        %%results in a straight line
    grid on;

figure;
x = linspace(1,100,10);
y = 3.*x.^2;
    subplot(2,2,1);
    plot(x,y);
    grid on;

    subplot(2,2,2);
    semilogx(x,y);
    grid on;

    subplot(2,2,3);
    semilogy(x,y);
    grid on;

    subplot(2,2,4);
    loglog(x,y);        %%results in a straight line
    grid on;
    
figure;
x = linspace(1,100,10);
y = 12*exp(x+2);
    subplot(2,2,1);
    plot(x,y);
    grid on;

    subplot(2,2,2);
    semilogx(x,y);
    grid on;

    subplot(2,2,3);
    semilogy(x,y);      %%results in a straight line
    grid on;

    subplot(2,2,4);
    loglog(x,y);
    grid on;

figure;
x = linspace(1,100,10);
y = 1./x;
    subplot(2,2,1);
    plot(x,y);
    grid on;

    subplot(2,2,2);
    semilogx(x,y);
    grid on;

    subplot(2,2,3);
    semilogy(x,y);
    grid on;

    subplot(2,2,4);
    loglog(x,y);        %%results in a straight line
    grid on;
    
%%Exercise 5.5
subplot(2,2,1);
fplot('5*t.^2', [-2*pi,2*pi]);
    title('f(t) = 5t^2');
    xlabel('t');
    ylabel('f(t)');
grid on;

subplot(2,2,2);
fplot('5*sin(t).^2 + t.*cos(t).^2',[-2*pi,2*pi]);
    title('f(t) = 5*sin(t).^2 + t.*cos(t).^2');
    xlabel('t');
    ylabel('f(t)');
grid on;

subplot(2,2,3);
fplot('t.*exp(t)',[-2*pi,2*pi]);
    title('f(t) = t.*exp(t)');
    xlabel('t');
    ylabel('f(t)');
grid on;

subplot(2,2,4);
fplot('log(t) + sin(t)',[-4*pi,4*pi]);
    title('f(t) = log(t) + sin(t)');
    xlabel('t');
    ylabel('f(t)');
grid on;

%--using plot--
subplot(2,2,1);
t = [-2*pi:0.1:2*pi];
plot(t,5*t.^2);
    title('f(t) = 5t^2');
    xlabel('t');
    ylabel('f(t)');
grid on;

subplot(2,2,2);
t = [-2*pi:0.1:2*pi];
plot(t,5*sin(t).^2 + t.*cos(t).^2);
    title('f(t) = 5*sin(t).^2 + t.*cos(t).^2');
    xlabel('t');
    ylabel('f(t)');
grid on;

subplot(2,2,3);
t = [-2*pi:0.1:2*pi];
plot(t,t.*exp(t));
    title('f(t) = t.*exp(t)');
    xlabel('t');
    ylabel('f(t)');
grid on;

subplot(2,2,4);
t = [-4*pi:0.1:4*pi];
plot(t,log(t) + sin(t));
    title('f(t) = log(t) + sin(t)');
    xlabel('t');
    ylabel('f(t)');
grid on;

%%---------------------------------Q2------------------------------------.
%%Figure 5.27
clear, clc
figure;
x = linspace(0,10*pi,1000);
y = cos(x);
z = sin(x);
plot3(x,y,z)
grid
xlabel('angle'), ylabel('cos(x)'), zlabel('sin(x)'), title('A Spring')

%%Figure 5.30
x = [-2:0.2:2];
y = [-2:0.2:2];
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2 - Y.^2);

%%Figure 5.30a
figure;
subplot(2,2,1)
mesh(X,Y,Z)
title('Mesh Plot'), xlabel('x-axis'), ylabel('y-axis'), zlabel('z-axis')

%%Figure 5.30b
subplot(2,2,2)
surf(X,Y,Z)
title('Surface Plot'), xlabel('x-axis'), ylabel('y-axis'), zlabel('z-axis')

%%Figure 5.30c
subplot(2,2,3)
contour(X,Y,Z)
xlabel('x-axis'), ylabel('y-axis'), title('Contour Plot')

%%Figure 5.30d
subplot(2,2,4)
surfc(X,Y,Z)
xlabel('x-axis'), ylabel('y-axis')
title('Combination Surface and Contour Plot')

%%Figure 5.31a
figure;
[x,y,z] = peaks;
subplot(2,2,1)
pcolor(x,y,z)

%%Figure 5.31b
subplot(2,2,2)
pcolor(x,y,z)
shading interp

%%Figure 5.31c
subplot(2,2,3)
pcolor(x,y,z)
shading interp
hold on 
contour(x,y,z,20,'k')

%%Figure 5.31d
subplot(2,2,4)
contour(x,y,z)

%%---------------------------------Q3------------------------------------.
x = linspace(0.988,1.012,241);
f1 = @(x)(x.^7 - 7.*x.^6 + 21.*x.^5 - 35.*x.^4 + 35.*x.^3 - 21.*x.^2 + 7.*x - 1);
f2 = @(x)((x-1).^7);

plot(x,f1(x),'r:');
hold on;
plot(x,f2(x),'b-');
set(gca, 'XTick', 0.99:0.005:1.01);
set(gca, 'YTick', -3*(10^-14):1*(10^-14):3*(10^-14));
grid on;
xlabel('x');
ylabel('y');
title('floating-point errors');
legend(' y1',' y2', 'location', 'SouthEast');

%%---------------------------------Q4------------------------------------.
Y = load('transistor_count.dat');

y = Y(:,1);
t = Y(:,2);

c1 = y(1);
t1 = t(1);

c = c1 * 2.^((t-t1)/2);

a = 1540.1813;
b = 0.5138;
f = a*2.^(b*(t-t1));

figure;
semilogy(t,y,'ro', t,c,'b-');
xlabel('year');
ylabel('count');
title('transistor count - Moore''s Law');
legend(' data', ' predicted', 'location', 'se');

%%---------------------------------Q5------------------------------------.
Y = load('screws.dat');
x = Y(:,1);
y = Y(:,2);

barmap = [100/255 1 255/255; 1 0.2 1]; 
colormap(barmap);
bar([1:1:12],[x y]);

title('screw inventory');
xlabel('month');
ylabel('number of screws');
legend(' 2004', ' 2005');
