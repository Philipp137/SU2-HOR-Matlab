%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Use:        Sum of all staples.
%Input:      site --- U_Field of Links
%             U_Field is of type Struct
%            (mu,n) --- index of Links
%
%Output:     Matrix U ~ SU(2)     
%Autor:      Philipp Krah
%Updated:    24.1.2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function A=sum_staples(site,n,mu,hop)
global DIMENSIONS;
Nr=[1 2 3 4];
Nr = Nr(Nr~=mu);% Nr only contains Indices not equal to mu
A=0;
Index=hop(n,mu);  % site-index of U_nu(n+mu) Link
for nu=Nr
  A=A + site(Index).mu_index(nu).U* ...
        site(hop(n,nu)).mu_index(mu).U'* ...
        site(n).mu_index(nu).U' ...
      + site(hop(Index,DIMENSIONS+nu)).mu_index(nu).U'* ...
        site(hop(n,DIMENSIONS+nu)).mu_index(mu).U'* ...
        site(hop(n,DIMENSIONS+nu)).mu_index(nu).U;  
end
end 