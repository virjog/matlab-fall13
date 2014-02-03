%%25 September 2013

%%Q1.
A = [2 2 7 3 
    8 5 4 5 
    5 6 1 8];

[a,b] = min(A);             %%minima of columns and their locations
[rmin,rl] = min(A,[],2);    %%minima of rows and their locations

[c,d] = max(A);             %%maxima of columns and their locations
[rmax,rl2] = max(A,[],2);   %%maxima of rows and their locations

cm = mean(A);               %%column means
cs = sum(A);                %%column sums
cp = prod(A);               %%column products

rm = mean(A,2);             %%row means
rs = sum(A,2);              %%row sums
rp = prod(A,2);             %%row products

cumsum(A);                  %%column cumulative sum
cumprod(A);                 %%column cumulative product
diff(A);                    %%column difference

cumsum(A');                 %%row cumulative sum
cumprod(A');                %%row cumulative product
diff(A');                   %%row difference
    
sort(A, 'descend');         %%sort columns in descending order
sortrows(A, [-1,-2,-3,-4]); %%sort rows in descending order

B = [0 0
     0 0];
A(2:3, 2:3) = B;

flipud(A);                  %%flip matrix A upside down
fliplr(A);                  %%flip matrix A left to right
fliplr(flipud(A));          %%flip matrix A upside down and left to right

diag(diag(A));              
A - [diag(diag(A)),zeros(3,1)];  %%replaces main diagonal with zeros

B = zeros(3,4);
B(1:2,1:2) = A(1:2,1:2);
A = B;

A(:,[2 4]) = A(:,[4 2]);    %%swap second and fourth columns
A([1 3],:) = A([3 1],:);    %%swap first and third rows

reshape(A,2,6);             %%reshapes matrix with dimensions 2x6    
reshape(A,4,3);             %%reshapes matrix with dimensions 4x3
A';

reshape(A,4,3) == A';       %%only the first and last elements of the matrices match. matrices are ordered differently
reshape(A,2,2,3);           %%reshape matrix into 3d array with dimensions 2x2x3

repmat(A,1,3);              %%replicate 3x horizontally
repmat(A,2,1);              %%replicate 2x vertically
repmat(A,2,3);              %%replicate 3x hori and 2x vert

[A,A,A];    
[A;A];
[A,A,A;A,A,A];

A==5;   %%replaces all values that are not 5 to 0 and that are 5 to 1
q = find(A==5);  %%outputs the location at which there is a 5 in the matrix             

A(q) = 50;  %%replaces all 5s in the matrix to 50
A(q) = 5;   %%replaces all 50s in the matrix to 5  

[A(1,:); [10 20 30 40]; A(2:3,:)];  %%add row vector between rows 2 and 3
[A(:,1:2), [10 20 30]', A(:,3:4)]   %%add column vector between columns 2 and 3

A([1,3],[1,2,4])                    %%removes 3rd column and 2nd row


%%Q2.
f = @(T,V) 35.74 + 0.6215 * T - 35.75 * V.^0.16 + 0.4275 * T .* V.^0.16;
t = 40:-10:-40;
v = 10:10:60;

[T,V] = meshgrid(t,v);
Twc = f(T,V);
fprintf('\n                  Physical Temperature (F)\n');
fmt = ['     |  ', repmat('%3.0f  ',1,10),  '\n'];
fprintf(fmt, t);

fprintf(['\n  V  ', repmat('-',1,46), '\n']);
fmt = ['%3.0f  |  ', repmat('%3.0f  ',1,9), '\n'];
fprintf(fmt,[v' Twc]');
