%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Use:       correlation - calculates the correlationfunction
%                       and integrated autocorrelationtime
%
%Input:      obs        scalar observable for each measurement
%Output:     t_int      integrated autocorrelation time
%            Gamma(t)   autocorelation function
%Autor:      Philipp Krah
%Updated:    24.1.2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





function [t_int,Gamma]=correlation(obs)
MEAN=mean(obs);
N=length(obs);
for t=0:N-1
    Gamma(t+1)=0; 
    for i=1:(N-t)
        Gamma(t+1)= Gamma(t+1)+ (obs(i)-MEAN)*(obs(i+t)-MEAN);
    end
    Gamma(t+1)= Gamma(t+1)/(N-t);
end


t_int=1/2+sum(Gamma)/Gamma(1);

end