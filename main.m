%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Use:        Main       - static quark potential simulation
%                         with heatbath algorithm for SU(2)
%Input:      LENGTH     - length of dimensions (equal distributed)
%            DIMENSIONS - Nr. of dimensions (4)
%Autor:      Philipp Krah
%Updated:    24.1.2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function E_p=main(beta,nor)
%% Initial Data
global LENGTH;
global DIMENSIONS;
global NVOL;
LENGTH=6;
seed=5;
rng(seed,'twister')
n_measure=30;
nupdate=1;
%nor=3;
THERMAL=10;
%beta= 2.1768;   %2*NVOL/g2; %0.7061237093500001











%% torus_hopping
% creates an array of next neighbours
% hop(x,i) gives for index x the i-th neighbour
% e.g.: DIMENSIONS=2, LENGTH=4
% Field:
%   1   2   3   4
%   5   6   7   8
%   9   10  11  12
%   13  14  15  16
%
%   neighbours of 1 in torus symmetrie: 2, 5, 13, 4
%
DIMENSIONS=4;
NVOL=LENGTH^DIMENSIONS;
hop=torus_hopping(LENGTH,DIMENSIONS);


h = waitbar(0,'Please wait...');
if exist('site.mat', 'file')
    site = load('site.mat');
    site=site.site;
else
    % File does not exist.
    %% Cold Start
    % initialice all links with zero 2x2 matrix
    for n=1:NVOL
        for mu=1:DIMENSIONS
            %site(n).mu_index(mu).U=randomSU2(0.5);
            site(n).mu_index(mu).U=eye(2);
        end
    end
    %% thermalice:
    for i=1:THERMAL
        site=update(site,hop,beta,nupdate,nor);
        waitbar(i/(n_measure+THERMAL),h,'Thermalice');
    end
end



Vmean=0;
V2=0;
n=1;
S(n)=plaquett(site,hop);
for i=1:n_measure
    site=update(site,hop,beta,nupdate,nor);
    
    n=n+1;
    waitbar((THERMAL+n)/(n_measure+THERMAL),h,[num2str(n),'. Measure']);
    
    %measure:
    S(n)=plaquett(site,hop);
    P=polyakov(site,hop);
    V=corr(P);
    V2=V.*V;
    Vmean=Vmean+V;
end

%do statistics
close(h)
Vmean=Vmean/n_measure;
V2=V2/n_measure;
sigma=sqrt(V2-Vmean.^2);

save('site.mat', 'site')
E_p=S;%/(6*NVOL);
h1=figure;
set(h1, 'Visible', 'Off');
gn=plot(E_p,'-*');
title(['meanvalue =', num2str(mean(E_p))])
xlabel('Monte Carlo Time')
ylabel('average plaquette $\langle S_p \rangle$')
xlim([0 n_measure])
h2=figure;
set(h2, 'Visible', 'Off'); 
gn=errorbar(Vmean(1:LENGTH/2),sigma(1:LENGTH/2))
xlabel('r')
ylabel('aV(r)')

% save plot
fname = './figure';
mkdir_if_not_exist(fname);
filesub=['_L',num2str(LENGTH),'_beta',num2str(beta)];
filename=['Plaquett',filesub,'.pdf']
saveas(h1, fullfile(fname,filename ));
filename=['Pot',filesub,'.pdf'];
saveas(h2, fullfile(fname,filename ));


% save data
directory = './data/pot';
mkdir_if_not_exist(directory); %creates directory if not exists
filename=['data_pot',filesub,'.dat'];
fileID=fopen(fullfile(directory,filename),'w'); % pointer to file
%write to file:
fprintf(fileID,'%f \t %f \n',[Vmean(1:LENGTH/2);sigma(1:LENGTH/2)]);
%save/close file:
fclose(fileID);

% save data
directory = './data/plaquett';
mkdir_if_not_exist(directory); %creates directory if not exists
filename=['data_plaquett',filesub,'.dat'];
fileID=fopen(fullfile(directory,filename),'w'); % pointer to file
%write to file:
fprintf(fileID,'%f \n',S);
%save/close file:
fclose(fileID);


end