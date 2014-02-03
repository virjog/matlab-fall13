%23 October 2013

%--------------------------1-----------------------
%Q1a
%consider following matrices
A = [1 5 50 30
    10 8 40 20
    40 80 9 8
    6 20 10 9];

B = [1 4 7
    2 10 20
    3 15 30];

C = [10 25 5 35];

%find indices of elements greater than 20 in each matrix 
a = find(A > 20);
b = find(B > 20);
c = find(c > 20);

%find row + column numbers of these elements
[i j] = find(A > 20);
[k l] = find(B > 20);
[m n] = find(c > 20);

%Q1b
%replace values greater than 20 with 200 in all matrices
A(A > 20) = 200;
B(B > 20) = 200;
c(c > 20) = 200;

%Q1c
%original matrices
A = [1 5 50 30
    10 8 40 20
    40 80 9 8
    6 20 10 9];

B = [1 4 7
    2 10 20
    3 15 30];

C = [10 25 5 35];

%find indices of elements greater than 10 & less than 30
a = find(A > 10 & A < 30);
b = find(B > 10 & B < 30);
c = find(C > 10 & C < 30);

%find values of these elements
A(a);
B(b);
C(c);

%Q1d
%determine # of elements in each matrix that are b/w 0<x<10 & 70<x<80
length(find(0 < A < 10)) + length(find(70 < A < 80)); 
length(find(0 < B < 10)) + length(find(70 < B < 80)); 
length(find(0 < C < 10)) + length(find(70 < C < 80)); 

%--------------------------2-----------------------
tub = load('tub.dat');

%Q8.1a
%find indices of elements greater than 105 degrees F
x = find(tub >= 105);

%Q8.1b
%determine how many times maximum allowable temp was exceeded
length(x);

%Q8.1c
%find times where temperature exceeded maximum allowable temp
y = find(tub(:,2) > 105);
tub(y,1);

%Q8.1d
%determine how many times temperature was less than minimum allowable temp
length(find(tub(:,2) < 102));

%Q8.1e
%determine times where temperature was less than minimum allowable temp
z = find(tub(:,2) < 102);
tub(z,1);

%Q8.1f
%determine times where temp was within allowable limits (102<x<105)
a = find(tub(:,2) >= 102 & tub(:,2) <= 105);
tub(a,1);

%Q8.1g
%determine maximum temp reached + at which time
X = max(tub);

%--------------------------3-----------------------
t = 0:0.01:70;
h = @(t)(2.13.*t.^2 - 0.0013.*t.^4 + 0.000034.*t.^4.751);     %height
v = @(t)(4.26.*t - 0.0052.*t.^3 + 0.000161534.*t.^3.751);     %velocity

%Q3b
a = find(f(t) <= 0);   %find all times when height = 0
t(a(2));               %find first instance height = 0 after t = 0

%Q3c
max_h = max(f(t));          %maximum height
max_ht = t(find(f(t) == max_h));     %time at which maximum occurs

%Q3d
%find maximum using fminbnd
g = @(t)-(2.13.*t.^2 - 0.0013.*t.^4 + 0.000034.*t.^4.751);
[x y] = fminbnd(g,0,70);     %max height is the same as part (c), but time is more accurate

%Q3e
X = fzero(v,35);    %time at which maximum occurs
f(X);                       %maximum height

%Q3f
i = @(t)-(4.26.*t - 0.0052.*t.^3 + 0.000161534.*t.^3.751);
[A B] = fminbnd(i,0,70);    %A = time for max on velocity plot, B = max height for velocity
f(A);

%Q3g
%height profile of a rocket
%fplot(f(t), t(a(2)), f(t(a(2))), max_ht, max_h, A, f(A));
fplot(h,[0 70]);
hold on;
plot(t(a(2)), f(t(a(2))), 'mo', max_ht, max_h, 'ro', A, f(A), 'go');
axis([0,70,0,1500]);
grid;
title('Height Profile of a Rocket');
xlabel('time (sec)');
ylabel('height (m)');
legend('h(t)', 'ground', 'max h', 'max v', 'Location', 'Best');

%velocity profile of a rocket
fplot(v,[0 70]);
hold on;
plot(t(a(2)), v(t(a(2))), 'mo', max_ht, f(t(a(2))), 'ro', A, -B, 'go');
axis([0,70,-150,100]);
grid;
title('Velocity Profile of a Rocket');
xlabel('time (sec)');
ylabel('height (m)');
legend('v(t)', 'ground', 'max h', 'max v', 'Location', 'Best');

