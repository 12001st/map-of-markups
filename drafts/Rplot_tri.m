%{
%Uniform
u=2;
l=1;

x=l:0.01:u;
R=-(1/(u-l))*(x.^2 - 2*u*x + l^2)./(x+l);
plot(x,R)
hold all

Tx = 0.5*(1+l./x);
plot(x,Tx)

xpeak = - l + sqrt(2*l*(u+l));
%}

%{
%log-normal
sig=1;
mug=1;

x=1.1:0.1:5*exp(mug);
T=exp(mug+sig^2/2)*logncdf(x-sig,mug,sig)./logncdf(x,mug,sig);
T1=exp(mug+sig^2/2)*logncdf(sig-x,mug,sig)./(1-logncdf(x,mug,sig));
Tx=T./x;
R=logncdf(x-sig,mug,sig)+x./T.*(1-logncdf(x-sig,mug,sig));

plot(x,T)
axis([1 7 0 5])
hold all

plot(x,R)
%}
close all
clear all

%a< c <b 
a=1.0;
c=4.1;
b=5.0; 

%case 1 increasing
%c=b;
x=a:0.01:c;
cd1=(x-a).^2./((b-a)*(c-a));
pd1=2*(x-a)./((b-a)*(c-a));
%if a<=x<c
T1=2*x.^3./(3*(b-a)*(c-a)); %
T2=-a*x.^2./((b-a)*(c-a));    %if a<x<c
T3=-2*a.^3./(3*(b-a)*(c-a))+a*a.^2./((b-a)*(c-a));
T4=T1+T2+T3;
T4f=T4./cd1;
Tx1=T4f./x;

R1=cd1+x./T4f.*(1-cd1);


%plot(x,Tx1)
%hold all
%plot(x,R1)


%case 2 decreasing
%b=3.0; 
%a=1;
%c=1;


y=c+0.01:0.01:b;
%if c<=x<=b
cd2=1-(b-y).^2./((b-a)*(b-c));
pd2=2*(b-y)./((b-a)*(b-c));
T11=-2*y.^3./(3*(b-a)*(b-c)); %
T12=b.*y.^2./((b-a)*(b-c));    %if a<x<c
T13=2*c.^3./(3*(b-a)*(b-c))-b*c.^2./((b-a)*(b-c));
T14=T11+T12+T13;
T14f=T14./cd2;

Tx2=T14f./y;
R2=cd2+y./T14f.*(1-cd2);

T24f=(T14f+T4f(end));
T24ff=(T4(end)+T14)./cd2;

T25=[T4f T24ff];
z=[x y];
Tx=T25./z;
cd=[cd1 cd2];

R=cd+z./T25.*(1-cd);

plot(z,Tx)
hold all
plot(z,R)







%plot(y,Tx2)
%hold all
%plot(y,R2)
%Tx3=(Tx1+Tx2)./(x+y);

%case 3 increasing and decreasing
