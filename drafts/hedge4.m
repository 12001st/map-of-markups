
function ph = hedge4(x,p,a,e1,e2,e3)
T1=2*(a-x).*x;
T2=(x.^2-1);
%T=T1./T2;

%ph = p - 0.5*(2*x*a - x.^2 - 1)./(a*x - 1)
ph = e3.*T2 - T2-T1;

