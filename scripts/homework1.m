n=100;
h=1/n;

% The slow way to fill out A

A=zeros(n-1,n-1);
for i=1:n-1,
  if (i-1>0)
    A(i,i-1)=-1/h^2;
  end
  if (i+1<n)
    A(i,i+1)=-1/h^2;
  end
  A(i,i)=1+2/h^2;
end

% The fast way to fill out A

% i=[1:n-1 1:n-2 2:n-1];
% j=[1:n-1 2:n-1 1:n-2];
% s=[(1+2/h^2)*ones(1,n-1) -1/h^2*ones(1,2*n-4)];
% A=sparse(i,j,s,n-1,n-1);

%b=ones(n-1,1);
%in this case, b doesn't equal 1. b equals x. 
b=zeros(n-1,1);
for i=1:n-1,
  if (i=1)
    b(i,1) = 0;
  end
  if (i=n-1)
    b(i,1) = 0;
  end
  b(i,1) = h^2*(i);
end

w=A\b;
w=[0,w',0];
x=[0:h:1];

plot(x,w)
