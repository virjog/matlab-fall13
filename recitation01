%%September 11, 2013

%% Q1.
a  = [2.3, 5.8, 9];
sin(a)     %%ans = 0.7457   -0.4646    0.4121
a + 3      %%ans = 5.3000    8.8000   12.0000

b = [5.2, 3.14, 2];
a + b      %%ans = 7.5000    8.9400   11.0000
a.*b       %%ans = 11.9600   18.2120   18.0000
a.^2       %%ans = 5.2900   33.6400   81.0000

c = [0 : 1 : 10];    %%c = 0     1     2     3     4     5     6     7     8     9    1
d = [0 : 2 : 10];    %%d = 0     2     4     6     8    10
linspace(10,20,6)   %%ans = 10    12    14    16    18    20    
logspace(1,2,5)     %%ans = 10.0000   17.7828   31.6228   56.2341  100.0000   

%% Q2.
a = [1, 2, 4, 5];
b = [5, 4, 2, 1];

a + 10     %%ans = 11    12    14    15
a*10       %%ans = 10    20    40    50
a + b      %%ans = 6     6     6     6
a.*b       %%ans = 5     8     8     5
a./b       %%ans = 0.2000    0.5000    2.0000    5.0000

a + 1./b   %%ans = 1.2000    2.2500    4.5000    6.0000
1./a + b   %%ans = 6.0000    4.5000    2.2500    1.2000
a.^2       %%ans = 1     4    16    25
a + b.^2   %%ans = 26    18     8     6
a.^2./a    %%ans = 1     2     4     5
    
a.^2./b    %%ans = 0.2000    1.0000    8.0000   25.0000
(a.^2)./b  %%ans = 0.2000    1.0000    8.0000   25.0000
a.^(2./b)  %%ans = 1.0000    1.4142    4.0000   25.0000
a./b.^2    %%ans = 0.0400    0.1250    1.0000    5.0000
(a./b).^2  %%ans = 0.0400    0.2500    4.0000   25.0000

%%After evaluating the code above, I can conclude the following about the
%%precedence of the operations + * / ^: MATLAB ranks the operations 
%%according to the following hierarchy: exponential, division, 
%%multiplication, and addition.

%% Q3. 

%%Creating a new M-file with the commands of the previous problem resulted
%%in the same output for question 2 as this M-file.

%%After following the second set of directions, the output from the third
%%file was NOT the same as the results from the first (single) M-file
%%created. The third M-file only executed the first command and gave output 
%%for only the first half of the command.

%% Q4.
C = [a;b] 

%%C =

%%1     2     4     5
%%5     4     2     1

save myfile.dat C -ascii -double
type myfile.dat
D = load('myfile.dat');

%% Q5.
%%2.19a
P = 220;
n = 2;
V = 1;
a = 5.536;
B = .03049;
R = 0.08314472;

x = linspace(0,400,10)';
y = x/(n*R);
z = ((x+(n^2*a/V^2))*(V - n*B))/(n*R);

num2str(x);
num2str(y);
num2str(z);

fprintf('    P          T_i        T_vw\n')
fprintf('----------------------------------\n')
fprintf('%7.3f  %11.5f  %11.5f\n', [x,y,z]')

%%    P          T_i        T_vw
%%----------------------------------
%%  0.000      0.00000    125.04498
%% 44.444    267.27160    376.01835
%% 88.889    534.54320    626.99173
%%133.333    801.81480    877.96510
%%177.778   1069.08639   1128.93848
%%222.222   1336.35799   1379.91186
%%266.667   1603.62959   1630.88523
%%311.111   1870.90119   1881.85861
%%355.556   2138.17279   2132.83199
%%400.000   2405.44439   2383.80536

%%2.19b
P = 220;
n = 2;
V = 1;
a = 5.536;
B = .03049;
R = 0.08314472;

x = linspace(0.1,10,10)';
y = (P.*x)./(n.*R);
z = ((P+(n^2.*a)./x.^2).*(x - n.*B))./(n.*R);

num2str(x);
num2str(y);
num2str(z);

fprintf('    V        T_i        T_vw\n')
fprintf('----------------------------------\n')
fprintf('%7.3f  %11.5f  %11.5f\n', [x,y,z]')

%%    V        T_i        T_vw
%%----------------------------------
%%  0.100    132.29944    571.23464
%%  1.200   1587.59330   1612.24908
%%  2.300   3042.88715   3018.57390
%%  3.400   4498.18100   4455.96864
%%  4.500   5953.47486   5901.98996
%%  5.600   7408.76871   7351.61311
%%  6.700   8864.06256   8803.08090
%%  7.800  10319.35642  10255.61923
%%  8.900  11774.65027  11708.83396
%% 10.000  13229.94413  13162.50326
