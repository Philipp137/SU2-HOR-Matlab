%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Use:        update   - classic heatbath + overrelaxaton
%                       run over all sites n
%Input:      site     - struct of all links
%            hop      - array of all neighbours
%            beta
%
%Autor:      Philipp Krah
%Updated:    24.1.2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





function site=update(site,hop,beta,nupdate,nor)

Nr_of_updates=0;
for i1=1:nupdate
    site=heatbath(site,hop,beta);
    Nr_of_updates=Nr_of_updates+1;
    for i2=1:nor
        site=overrelaxation(site,hop);
        Nr_of_updates=Nr_of_updates+1;
    end
    % do unitarication after unitNr of updates
    
    site = unit(site);
    
end

end