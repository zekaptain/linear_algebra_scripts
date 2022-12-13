%author: Zeke Elkins

A = rand(5);
%... do the QR factorization of A ...
size(A);
[m,n]=size(A);
%Q is diagonal identity matrix
Q = eye(m);
R = A;

for j=1:n-1,
  for i=j+1:m,
    if (A(i,j) ~= 0)
      r = sqrt((A(j,j))^2 + (A(i,j))^2);
      if (A(i,j) < 0)
        r = -r;
      endif
      s = (A(i,j))/r;
      c = (A(j,j))/r;
      
      for k=j:n,
        jk = A(j,k);
        ik = A(i,k);
        R(j,k) = c*jk + s*ik;
        R(i,k) = -s*jk + c*ik;
      end
      if (c == 0)
        R(i,j) = 1;
      elseif (abs(s) < abs(c))
        if (c < 0)
          R(i,j) = 1;
        else
          R(i,j) = 0.5*s;
        endif
      else 
        R(i,j) = 2.0/c;
      endif
      
    endif 
  end
end 

Q*Q'  % This should print out the 5x5 identity matrix
R  % visually verify that it is upper triangular
A-Q*R  % This should print out the 5x5 zero matrix

