function pc = offer4(x,p,a,gamma,c,e1,e2,e3)
T1=(a-x)./(a-1);
pc= p.*T1-c*gamma*(x.*(p.^(-e3))).^(gamma-1);