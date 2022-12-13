%final exam code -- Schrodinger's equation
%author: Zeke Elkins


%set up values
h = 0.05; 
N = 100;
Nh = 5; %approximate infinity with 5 lol
D2 = zeros(N-1,N-1);
W = zeros(N-1,N-1);

%D2 matrix -- fill this out
%D2 = d2/dx2*psi(x) 
for i=1:2*(N-1),
  
  if (i-1>0)
    D2(i,i-1) = 1/h^2;  
  end
  if (i+1<N)
    D2(i,i+1) = 1/h^2;
  end
  D2(i,i) = -2/h^2;
  
end 


count=-99;
%W matrix -- fill this out
for j=1:2*(N-1),
  
  %x(i) = i*h; -- scaling factor. Since we do -Nh to Nh,
  %i*h makes sure the x is along the scale of -Nh to Nh
  %count in this place is xi, multiplied by h to scale
  W(j,j) = calcVx(count*h);
  count = count+1;
end 
 
M = ((-1/2)*D2) + W



[P,D] = eig(M); %D is eigenvalue vector, P is matrox whose columns are eigenvectors
[D,ind] = sort(diag(D)); %sorts from smallest to largest
P = P(:,ind); %sorts eigenvectors w/ index value from above (puts eigenvectors smallest to largest too)
P=P(:,1:4);

%plot eigenfunctions 
x=linspace(-Nh,Nh,2*(N-1))';

plot(x,P);


