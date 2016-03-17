%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Use:       polyakov - evaluates the polyakovloop
%
%Input:      site     - struct of all links
%            hop      - array of all neighbours
%Autor:      Philipp Krah
%Updated:    24.2.2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





function P=polyakov(site,hop)
global LENGTH NVOL;
U=eye(2);
NRspacePoints=NVOL/LENGTH;
for m=1:NRspacePoints
    tempU=site(m).mu_index(4).U;
    j=hop(m,4);
    % repeat product until starting point is reached again
    while j~=m
        tempU=tempU*site(j).mu_index(4).U;
        j=hop(j,4);
    end
    P(m)=trace(tempU)/2;
end
end