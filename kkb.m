function C = kkb(x,y,F,m,n)
%x and y must be row vectors with n1 and n2 elements respectively,
%F must be a matrix of dimension n2xn1,
%m and n must be integers, and smaller than n1 and n2 respectively.
%The result C will be a matrix of dimension (n+1)x(m+1), containing the
%coefficients of the given least squares problem.

%Require the dimensions of x, y and F.
[m1,n1] = size(x);
[m2,n2] = size(y);
[m3,n3] = size(F);

%Check whether the dimensions of x, y and F and the degrees m and n are
%compatible with each other.
if ((m1 == 1) && (m2 == 1) && (n1 > m) && (n2 > n) && (n1 == n3) && (n2 == m3))
  
  %Calculate the Vandermonde matrices A and B for the vectors x and y respectively. 
  A = fliplr(vander(x));
  A = A(:,1:(m+1));
  B = fliplr(vander(y));
  B = B(:,1:(n+1));
  
  %Calculate the pseudo-inverses of matrix A and B.
  Aplus = pinv(A);
  Bplus = pinv(B);
  
  %Calculate the matrix C.
  C = Bplus*F*transpose(Aplus);
end
end

