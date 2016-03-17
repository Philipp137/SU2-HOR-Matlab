%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Use:        overrelaxation - U - > U'V'U'
%Input:      site     - struct of all links
%            hop      - array of all neighbours
%Return:     updated configuration
%Autor:      Philipp Krah
%Updated:    24.1.2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function site=overrelaxation(site,hop)
global NVOL DIMENSIONS;
epsilon=0.25;

for mu=1:DIMENSIONS
    for n=1:NVOL
        A=sum_staples(site,n,mu,hop);
        a=sqrt(det(A));
        
        if ( a < 1e-12 )
             site(n).mu_index(mu).U = randomSU2(epsilon);
        else
            V=A/a;
            site(n).mu_index(mu).U =V'*site(n).mu_index(mu).U'* V';
        end
    end
end

end