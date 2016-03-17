%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Use:        distribute
%               - find random parameters with
%               propability distribution
%dP(X)=(1/2pi^2) dcos(theta) dphi dx_0 sqrt(1-x_0^2)exp(a*beta*x_0)
%
%Input:      a        - variable a=det(A)
%            beta     - variable beta=NVOL*2/g^2
%Output:     4-vector x with coefficients of pauli matrices
%Autor:      Philipp Krah
%Updated:    24.1.2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function x=distribute(a,beta)
acc=0;
while acc==0
    acc=1;
    chi=exp(-2*beta*a)+rand()*(1-exp(-2*beta*a));
    x(1)=1+log(chi)/(beta*a);
    if rand()<=1-(1-x(1)^2)^(1/2)
       acc=0; 
    end
end
r=sqrt(1-x(1)^2);

phi=2*pi*rand();% 0<phi<2pi
%in order to have a equal distribution on a sphere
%where one uses dV=dcos(theta) dphi, theta can not
%be choosen randomly in 0<theta<pi
t=2*rand()-1;
theta=acos(t);

x(2)=r*cos(phi)*sin(theta);
x(3)=r*sin(phi)*sin(theta);
x(4)=r*cos(theta);

%2.posibility to construct random vector with length r
%f=randn(3,1);
%x(2:4)=r*f/norm(f);

end