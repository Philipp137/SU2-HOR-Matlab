%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Use:        re - unitarization of Links
%Input:      site --- Field of Links
%             site is of type Struct
%            (mu,n) --- index of Links
%
%Output:     re-unitariced Links     
%Autor:      Philipp Krah
%Updated:    1.2.2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% site(n).mu_index(mu).U
function site=unit(site)
global DIMENSIONS
global NVOL

for n=1:NVOL
 for mu=1:DIMENSIONS
    row=site(n).mu_index(mu).U(1,:);
    row=row/norm(row);
    site(n).mu_index(mu).U(1,:)=row;
    site(n).mu_index(mu).U(2,1)=-row(2)';
    site(n).mu_index(mu).U(2,2)=row(1)';
    % det(site(n).mu_index(mu).U);
end
end