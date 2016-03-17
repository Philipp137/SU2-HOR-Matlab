%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Use:        Construct SU(2)- matrix from pauli matrices
%Input:      x_0:=x(1) ......... coefficient of identity
%            x_j:=x(j+1) ......... coefficient of sigma_i
%            j=1,2,3 (since matlab indices start by 1)
%            x Vector of coefficients has to be normaliced
%
%Output:     SU(2) Matrix U
%
%Autor:      Philipp Krah
%Updated:    24.1.2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function U=build_SU2(x)
if norm(x)-1>1e-5
    warning('Output det(U)=%f is not equal to 1!',norm(x)^2);
  
end
U=x(1)*eye(2)+1i*x(2)*[0 1; 1 0]+1i*x(3)*[0 -1i;1i 0]+1i*x(4)*[1 0;0 -1];
end