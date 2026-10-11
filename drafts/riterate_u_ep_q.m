clear all

u=2;
l=1;
c0=0.5;

q=0.95;
c=0.5;
h=0.1;

ep=6;

%% u

for i=1:100
     
    u = u + 0.01;

SS = @(v)[v(2)-((u-l)*c0-q*(c-h)*(v(1)-l))/(u-v(1));
    v(2)*(1-(1/ep)*(1+2*v(1)*(u-v(1))/(v(1)^2-l^2)))-q*(c-h)];

v0 = [1.5;0.7];
options = optimset('MaxFunEvals',3e10,'TolFun',3e-10); % options = optimset('Display','iter','MaxFunEvals',3e3);
[v, fval] = fsolve(SS,v0,options);

x(i) = v(1);
p(i) = v(2);
ud(i)=u;

mu(i) = p(i)/c0-1;
y(i) = x(i)*(1-p(i));

R(i) = -(1/(u-l))*(x(i)^2 - 2*u*x(i) + l^2)/(x(i)+l);
Tx(i) = 0.5*(1+l/x(i));
xpeak(i) = - l + sqrt(2*l*(u+l));

end

i=1:1:100;

figure(4);hold on;
plot(y(i),mu(i))
axis([.45 .8 .215 .245]);
axis square;
set(gcf,'Units','normal')
set(gca,'Position',[.1 .1 .9 .8])
xlabel('production','Interpreter','Latex','FontSize',12);
ylabel('markup rate','Interpreter','Latex','FontSize',12);
%text(0.47,0.218,'\rightarrow \rightarrow \rightarrow \rightarrow \rightarrow','FontSize',14);
%text(0.47,0.2165,'easier to carry inventories','FontSize',11);
grid on;
box on;
