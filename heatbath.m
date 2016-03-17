%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Use:        heatbath - classic heatbath algorithm
%                       run over all sites n
%Input:      site     - struct of all links
%            hop      - array of all neighbours
%            beta
%Autor:      Philipp Krah
%Updated:    24.1.2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





function site=heatbath(site,hop,beta)
global NVOL DIMENSIONS;


for mu=1:DIMENSIONS
    for n=1:NVOL
        site(n).mu_index(mu).U = update_link(site,n,mu,hop,beta);
    end
end





end