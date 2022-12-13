clear
n=3;
r=0;
l=1;
k=1;
S2=0;
M = rand(n);

%A = M'*M;
A = [4 6 10; 6 13 17; 10 17 42];
R = zeros(n,n);
%code that computes cholesky factorization, stored as R

%first, check if R is positive definite 
  %to do this, vals in R must be positive 

for i=1:n,
  for l=1:i-1,
    r = r + (R(l,i))^2;
  end
  temp = A(i,i) - r;
  assert(temp > 0, 'Matrix is not positive definite.');
  R(i,i) = sqrt(temp);
  for j=i+1:n,
    for k=1:i-1,
      S2 = S2 + (R(k,i) * R(k,j));
    end
    R(i,j) = (A(i,j) - S2)/R(i,i);
  end
end
    
    
R
A - (R' * R) 

