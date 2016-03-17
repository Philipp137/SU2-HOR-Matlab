function [hop] = torus_hopping(L,D)

%   Bewegungen zu naechsten Nachbarn auf dem Torus
%   der Kantenlaenge L in D Dimensionen

%   Jeder Torus-Punkt x=(x_0,...,x_{D-1}) wird numeriert mit
%   n_x=x_0 + x_1*L + x_2*L^2 + ... + x_{D-1}*L^{D-1};
%   hop(n+1,mu+1)   enthaelt den Index von x+mu_hat,
%   hop(n+1,mu+1+D) enthaelt den Index von x-mu_hat,
%   (mu_hat = Einheitsvektor in Richtung mu=0,1,..,D-1)
%   Matlabindizes um 1 erhoeht, da sie bei 1 nicht 0 beginnen!

hop=zeros(L^D,2*D);
for n_x=0:L^D-1                % alle Gitterpunkte
    r_x=n_x;              
    for mu=D-1:-1:0            % alle Richtungen
        Lmu=L^mu;
        x_mu=floor(r_x/Lmu);   % Komponente x_mu aus n_x geholt
        r_x=r_x-x_mu*Lmu;      % Restindex aus x_0 .. x_(mu-1) 
        x_muP=mod(x_mu+1,L);   % vorwaerts
        hop(n_x+1,mu+1)=n_x+(x_muP-x_mu)*Lmu+1;
        x_muM=mod(x_mu-1,L);   % rueckwaerts
        hop(n_x+1,D+mu+1)=n_x+(x_muM-x_mu)*Lmu+1;
    end % loop mu
end % loop n_x