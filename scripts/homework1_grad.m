n=10;
h=1/n;

% The slow way to fill out A

A=zeros((n-1)^2,(n-1)^2);

incrj = 4;
%for big = 1:n-1
  for i = 1:((n-1)^2) %i is rows
    %if (i==incri)
     % A(i,count)=-1/h^2;
    %end
    for j=1:((n-1)^2) %j is cols 
      if (i==j)
        A(i,j)=(4/h^2) + 1;
      end
      if (j==i+1)
        A(i,j)=-1/h^2;
      end
      if (i == j+1)
        A(i,j) = -1/h^2;
      end
      %top diagonal row 
      if (j==incrj)
        A(i,j) = -1/h^2;
      end 
      %bottom diagonal row 
      if (j==incrj)
        A(j,i) = -1/h^2;
      end 
    end
    incrj++;
  end
%end
% The fast way to fill out A

% i=[1:n-1 1:n-2 2:n-1];
% j=[1:n-1 2:n-1 1:n-2];
% s=[(1+2/h^2)*ones(1,n-1) -1/h^2*ones(1,2*n-4)];
% A=sparse(i,j,s,n-1,n-1);

b=ones((n-1)^2,1);

w=A\b;
%w=[0,w',0];
w=w';
x=[0:h:0.8];
y=[0:h:0.8];
w=reshape(w,9,9);
%plot(x,w)
mesh(x,y,w)