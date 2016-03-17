clc
beta=2.178;
n=0;
NOR=[1:8];
for nor=NOR
    main(beta,nor);
    nor
    E_p=main(beta,nor)
    n=n+1;
    close all
    tau(n)=fit_correlation(E_p)    
end

plot(NOR,tau,'*');
ylabel('$\tau_{int}$')
xlabel('$n_{or}$')
