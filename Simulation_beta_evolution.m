%clear all
clc
BETA=[0.4:0.4:8];
n=1;
nor=3;
for beta=BETA
    main(beta,nor);
    beta
    E_p(n)=mean(main(beta,nor))
    n=n+1;
    close all
end

plot(BETA,E_p,'*');
xlabel('$\beta$')
ylabel('$\langle S_p \rangle$')
ylim([0 max(E_p)])

dE=diff(E_p)
plot(BETA(1:end-1),dE,'-*')
xlabel('$\beta$')
ylabel('$\frac{d}{d\beta}\langle S_p \rangle$')
