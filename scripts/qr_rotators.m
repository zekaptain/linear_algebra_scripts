function [Q,R] = qr_rotators(A)
  [m,n] = size(A);
  Q = eye(m);
  R = A;

  for j = 1:n
    for i = m:-1:(j+1)
      G = eye(m);
      [c,s] = rotation( R(i-1,j),R(i,j) );
      G([i-1, i],[i-1, i]) = [c -s; s c];
      R = G'*R;
      Q = Q*G;
    end
  end
  Q*Q'  % This should print out the 5x5 identity matrix
  R  % visually verify that it is upper triangular
  A-Q*R  % This should print out the 5x5 zero matrix
  
  
end


