%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Use:        update   - update of a single link according
%                       to the propability distribution
%                       dP(X)=dX exp(a*beta*real(trace(X)))
%Input:      site     - struct of all links
%            (n,mu)   - index pair of link
%            hop      - array of next neighbours
%Autor:      Philipp Krah
%Updated:    24.1.2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function U=update_link(site,n,mu,hop,beta)
epsilon=0.25;
% STEPS:
%% 1. Find the sum of staples A, compute a=sqrt(det(A)), set V=A/a
A=sum_staples(site,n,mu,hop); %problem is det(A) gets imaginary part after a while
a=det(A);
a=sqrt(a);
%% 2. Find group element X according to distribution dP(X)
if (a<1e-10)
    U=randomSU2(epsilon);
else
   x=distribute(a,beta);
   X= build_SU2(x);
%% 3. new link varable is U=X*V'
   V=A/a;
   U=X*V';
end
end