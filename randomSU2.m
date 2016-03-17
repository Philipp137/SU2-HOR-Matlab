%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Use:       randomSU2 - generates random elements of SU(2)
%                       run over all sites n
%Input:     epsilon - 
%Output:     U in SU(2), hence det(U)=1 U*U'=1     
%Autor:      Philipp Krah
%Updated:    24.1.2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





function U=randomSU2(epsilon)
r=rand(4,1)-0.5;
r(2:4)=epsilon*r(2:4)/norm(r(2:4));
r(1)=sign(r(1))*sqrt(1-epsilon^2);
U=build_SU2(r);
end