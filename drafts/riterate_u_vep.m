clear all

u=2;
l=1;
c0=0.4;

q=0.9;
c=0.5;
h=0.2;
ep=5;
a1=2;
a2=1;

%% u
for i=1:100
    
    u = u + 0.01;

SS = @(v)[v(2)-((u-l)*c0-q*(c-h)*(v(1)-l))/(u-v(1));
    v(2)*(1-((a1-a2*v(2))/(a2*v(2)))*(1+2*v(1)*(u-v(1))/(v(1)^2-l^2)))-q*(c-h)];

v0 = [1.5;0.7];
options = optimset('MaxFunEvals',3e10,'TolFun',3e-10); % options = optimset('Display','iter','MaxFunEvals',3e3);
[v, fval] = fsolve(SS,v0,options);

x(i) = v(1);
p(i) = v(2);

mu(i) = p(i)/c0-1;
y(i) = x(i)*(a1-a2*p(i));

R(i) = -(1/(u-l))*(x(i)^2 - 2*u*x(i) + l^2)/(x(i)+l);
Tx(i) = 0.5*(1+l/x(i));
xpeak(i) = - l + sqrt(2*l*(u+l));

end

i=1:1:100;

figure(4);clf;hold on;
subplot(1,3,1)
plot(2+0.01*i,p(i),'-b',2+0.01*i,mu(i),'-r')
subplot(1,3,2)
plot(2+0.01*i,x(i),'-b',2+0.01*i,y(i),'-r')
subplot(1,3,3)
plot(2+0.01*i,R(i),'-b',2+0.01*i,Tx(i),'-r',2+0.01*i,xpeak(i),'-k')
