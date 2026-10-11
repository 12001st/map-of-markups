%syms a x; solve(a*x^3-3*x^2+(-a^3+2*a^2+2)*x-a^2,x);
%{
a = 0.9;
syms x; solve(x*(x^2-a^2)*(2*x-x^2-a^2)^2*(1-x)^2 - 8*(1-a)^2*(x-a^2)^3,x)
x=-0.1:0.1:2.4;
y=x.*(x.^2-a^2).*(2*x-x.^2-a^2).^2.*(1-x).^2 - 8*(1-a)^2*(x-a^2).^3;
plot(x,y); grid on;
%}


%p - 0.5*(2*x - x^2 - a^2)./(x - a^2) = 0;
%x*(1-p)*p^2*(1-x)^2/(1-a)^2 - 1 = 0;

%p = -0.1:0.05:1.1;
%x = -0.1:0.05:1.1;

clear all
close all
%set(p,'Color','red','LineWidth',2)
%offer3(x,p,a,gamma,c,e1,e2)=(x,p,1.5,10,0.5,3,1)
%hedge3(x,p,a,e1,e2)
e1=3;  %D(p)=e1-e2p then p >e1/2e2
e2=1;
e3=50;
c=0.5;
a=2;
gamma1=10;
gamma2=50;


phc = ezplot(@(x,p)hedge4(x,p,a,e1,e2,e3),[-2.0,2.1],[-1,2]);
set(phc,'Color','red','LineWidth',2);
axis square;
hold all;

%pcc = ezplot(@(x,p)offer4(x,p,a,gamma1,c,e1,e2,e3));
%set(pcc,'Color','blue','LineWidth',2);
%hold all;

pcc = ezplot(@(x,p)offer4(x,p,a,gamma2,c,e1,e2,e3),[-2.0,2.1],[-1,2]);
set(pcc,'Color','black','LineWidth',2);
hold all;

%pmc = ezplot(@(x,p)mc3(x,p,a,gamma1,c,e1,e2));
%set(pmc,'Color','green','LineWidth',2);
%hold all;
%grid on

%pmc = ezplot(@(x,p)mc4(x,p,a,gamma2,c,e1,e2,e3));
%set(pmc,'Color','yellow','LineWidth',2);
%hold all;

grid on



grid on;

