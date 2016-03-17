function t=fit_correlation(E_p)
[t_int,E_p]=correlation(E_p)
x=[1:length(E_p)];
f=@(a,x) a(2)*exp(-x/a(1));

a=lsqcurvefit(f,[2,1],x,E_p);
h=plot([1:length(E_p)],E_p,'*',x,f(a,x));
t=a(1);
end