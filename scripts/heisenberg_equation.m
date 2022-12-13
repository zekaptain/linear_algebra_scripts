%final exam code -- Heisenberg's equation
%author: Zeke Elkins

clear

%set up values
h = 0.05; 
N = 100;
Nh = 5; %approximate infinity with 5 lol
D2 = zeros(N,N);
X = zeros(N,N);

%D2 matrix -- fill this out
%D2 = d2psi/dx2 
count=1;
count2=0;
for i=1:N,
  
  if (i-1>0)
    D2(i,i-1) = -(sqrt(count2));  
  end
  if (i+1<N)
    D2(i,i+1) = sqrt(count);
  end
  D2(i,i) = 0;
  count = count+1;
  count2 = count2+1;
  
end 

D2= (1/sqrt(2)).*D2;

count=1;
count2=0;
%X matrix -- fill this out
for j=1:N-1,
  
  if (j-1>0)
    X(j,j-1) = sqrt(count2);  
  end
  if (j+1<N)
    X(j,j+1) = sqrt(count);
  end
  X(j,j) = 0;
  count = count+1;
  count2 = count2+1;
  
end 

X= (1/sqrt(2)).*X;

M = ((-1/2).*D2^2) + (0.1).*X^4 - X^2 + (0.1).*X;



[P,D] = eig(M); %D is eigenvalue vector, P is matrox whose columns are eigenvectors
[D,ind] = sort(diag(D)); %sorts from smallest to largest
P = P(:,ind); %sorts eigenvectors w/ index value from above (puts eigenvectors smallest to largest too)




