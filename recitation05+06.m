%16 October 2013

%--------------------------1-----------------------
y = @(x)(exp(-a.*x) .* cos(b.*x) + cos(c.*x));
a = 0.5;
b = 2;
c = 3;
x = 0:4;
hold on;
fplot(y,[0 4]);

[A B] = fzero(y,[0 1]);
plot(A,B,'go');
hold on;
[C D] = fzero(y,[1 2]);
plot(C,D,'go');
hold on;
[E F] = fzero(y,[2 3]);
plot(E,F,'go');
hold on;
[G H] = fzero(y,[3 4]);
plot(G,H,'go');
hold on;

z = @(x)-(exp(-a.*x) .* cos(b.*x) + cos(c.*x));

[I J] = fminbnd(y,0,1.5);           %minimum
plot(I,J,'ro')
hold on;

[K L] = fminbnd(z,0,1.5);           %maximum
plot(K,-L,'ro')
hold on;

M = fminbnd(z,2,3);         %maximum
plot(M,y(M),'ro')
hold on;

[O P] = fminbnd(y,2.5,3.5);         %minimum
plot(O,P,'ro')
hold off;

a = 1;
b = 4;
c = 2;
hold on;
fplot(y,[0 4]);

[A B] = fzero(y,[0 1]);
plot(A,B,'go');
hold on;
[C D] = fzero(y,[2 3]);
plot(C,D,'go');
hold on;

z = @(x)-(exp(-a.*x) .* cos(b.*x) + cos(c.*x));

[I J] = fminbnd(y,0,2);           %minimum
plot(I,J,'ro')
hold on;

[K L] = fminbnd(z,0,1.5);           %maximum
plot(K,-L,'ro')
hold on;

M = fminbnd(z,3,4);         %maximum
plot(M,y(M),'ro')
hold on;
%--------------------------2-----------------------
t = 0:0.01:30;
h = height(t);
plot(t,h);
hold on;

[a b] = max(h);
t(b);   %time in sec at which rocket is at maximum point

%determine maximum using fminbnd
h = @(t)-(-9.8/2) .* t.^2 + 125 .* t + 500;
[X Y] = fminbnd(h,0,30);

h = @(t)(-9.8/2) .* t.^2 + 125 .* t + 500;
[xx yy] = fzero(h,20);  %when the rocket has landed

%plot function, labels plot
h= height(t);
plot(t,h,X,-Y,'go',xx,yy,'r.');
xlabel('time [sec]');
ylabel('altitude [m]');
axis on;
set(gca,'XTick',[0 5 10 15 20 25 30 35]);
set(gca,'YTick',[0 500 1000 1500]);
title('Rocket Trajectory');
legend('height','max','ground');

%--------------------------3-----------------------
fp = fopen('rec0506.dat');
fgetl(fp);      %skip first line
fgetl(fp);      %skip second line
A = fscanf(fp,'%f %*s %f %*s %f');  %read numerical columns
F = reshape(A,3,4)';                %reshape into 4x3 matrix

%extract individual numerical columns
X = F(:,1); 
Y = F(:,2);
Z = F(:,3);

frewind(fp);
fgetl(fp);
fgetl(fp);

%read file from two text columns
C = textscan(fp, '%*f %s %*f %s %*f');
A = C{1};
B = C{2};

%sort column Y in ascending order
[Ys,i] = sort(Y,'ascend');
%sort other columns according to Y's sorting index
Xs = X(i);
Zs = Z(i);
As = A(i);
Bs = B(i);

fp = fopen('rec0506.dat');
fgetl(fp);

%make variables for original header lines
L1 = '  A        X          Y          Z         B'; 	
L2 = fgetl(fp);

fp = fopen('week6b.dat', 'w');	

%write original header lines 
fprintf(fp, [L1,'\n']);
fprintf(fp, [L2,'\n']);

%write sorted columns
for i=1:4, 
   fprintf(fp, ' %4s   %7.3f   %10.5f   %8.2f   %-5s\n', As{i}, Xs(i), Ys(i), Zs(i), Bs{i});
end
