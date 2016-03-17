%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Use:        specificheat - evaluates simple plaquette
%                            action
%Input:      site     - struct of all links
%            hop      - array of all neighbours
%Autor:      Philipp Krah
%Updated:    24.1.2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





function S=plaquett(site,hop)
global NVOL DIMENSIONS;

S=0;
for n=1:NVOL
    for nu=[4,3,2]
        for mu=1:(nu-1)
            Up= site(n).mu_index(mu).U * ...
                site(hop(n,mu)).mu_index(nu).U * ...
                site(hop(n,nu)).mu_index(mu).U' * ...
                site(n).mu_index(nu).U';
            S=S+real(trace(Up));
        end
    end
end
S=S/(2*6*NVOL);
   


end