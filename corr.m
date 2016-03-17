%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Use:       corr - evaluates the correlationfunction
%                    of polyakov loop
%
%Input:      P(m)       m=1...NrspacePoinst
%Output:     aV(m-n)    static potential
%Autor:      Philipp Krah
%Updated:    24.1.2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [V] = corr(P)
global LENGTH NVOL DIMENSIONS;
hop=torus_hopping(LENGTH,DIMENSIONS-1);
NRspacePoints=NVOL/LENGTH;
for r=1:(LENGTH-1)
    Vtemp=0;
    for D=1:DIMENSIONS-1
        for i=1:NRspacePoints
            index=i;
            for neighbour=1:r
               index =hop(index,D);
            end
            Vtemp=Vtemp+P(i)*conj(P(index));
        end
    end
    Vtemp =Vtemp/NRspacePoints;
    
    V(r)=Vtemp;
    
end   
    
    V=V/(DIMENSIONS-1);
    V=-log(V)/LENGTH;
end