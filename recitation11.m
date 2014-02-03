%20 November 2013

%----------------------------------1---------------------------------------
%Q1a.
%temperature + pressure data
Ti = [250:10:350];
Pi = [260 504 1184 2910 3913 9462 18841 16952 41529 86903 77537];

%known values
A = 10.33;
B = 1642.89;
C = -42.85;

ce = [A B C]';      %exact parameters
c0 = [1 1000 -1]';  %initial parameters

f = @(c,t)(c(1) - (c(2) ./ (c(3) + t)));    %antoine equation

c = nlinfit(Ti,log10(Pi),f,c0);     %nlinfit model function

T = linspace(250,350,360);
P = f(c,T);
    
plot(T,P,'r-',T,f(ce, T),'k:',Ti,log10(Pi),'b.');   %generate plot

xlabel('T (K)');
ylabel('log_{10}(P)');
title('Antoine Equation');
xlim([240 360]);
ylim([2 6]);
set(gca,'xtick',[220:20:380]);
set(gca,'ytick',[2:1:6]);
legend('nlinfit method', 'known model', 'data', 'Location', 'Best');

%Q1b.
%temperature + pressure data
Ti = [250:10:350];
Pi = [260 504 1184 2910 3913 9462 18841 16952 41529 86903 77537];

%polyfit
P = polyfit(Ti, 1 ./ (A - log10(Pi)), 1);
B = 1 / P(1);
C = P(2) / P(1);

T = linspace(250,350,360);
y = A - (B ./ (C + T));

%generate plot
plot(T,y,'r-',T,f(ce,T),'k:',Ti,log10(Pi),'b.');

xlabel('T (K)');
ylabel('log_{10}(P)');
title('Antoine Equation');
xlim([240 360]);
ylim([2 6]);
set(gca,'xtick',[220:20:380]);
set(gca,'ytick',[2:1:6]);
legend('polyfit method', 'known model', 'data', 'Location', 'Best');

%----------------------------------2---------------------------------------
%data
xi = [1.0 1.4 1.9 2.1 2.7 3.0 3.3 3.9 4.2]';
yi = [.18 .21 .21 .20 .20 .19 .18 .16 .16]';
x = linspace(1,4.2,100);

%Q2a. - basis function
A = [1 ./ xi, xi];
c = A \ (1 ./ yi);
y = 1 ./ (c(1) ./ x + c(2) * x);
plot(x, y, 'r-');
hold on;

%Q2b. - polynomial fit
p = polyfit(xi,(xi ./ yi), 2);
A = p(3);
B = p(1);
c = [c; A; B];
y2 = (x ./ (A + B .* x.^2));
plot(x,x ./ polyval(p,x),'g--');
hold on;

%Q2c. - nonlinear regression
A = [1 ./ xi, xi];
c2 = A \ (1 ./ yi);
y3 = @(c2, x)(1 ./ (c2(1) ./x + c2(2) .* x));
c0 = c2;
c2 = nlinfit(xi,yi,y3,c0);
c = [c; c2];
k = y3(c2,x);

%generate plot
plot(x,k,'k:', xi, yi, 'b.');
hold off;

xlabel('x');
ylabel('y');
title('y = 1/(a/x + b*x)');
xlim([0.5 4.5]);
ylim([0.15 0.24]);
set(gca,'xtick',[1:4]);
set(gca,'ytick',[0.16:.02:0.24]);
legend('basis functions', 'polyfit', 'nlinfit', 'data', 'Location', 'Best');

%Q2d.
fprintf('    method           a         b   \n');
fprintf('-----------------------------------\n');
fprintf('basis functions   %0.4f    %0.4f\npolyfit\t\t\t  %0.4f    %0.4f\nnlinfit\t\t\t  %0.4f    %0.4f',c);
