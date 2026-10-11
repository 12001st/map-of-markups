
clear all
close all

u=2;
l=1;
c0=0.5;

q=0.9;
c=0.5;
h=0.1;

xpeak = - l + sqrt(2*l*(u+l));

%% q

for i=1:10
    
    q = q + 0.01;

SS = @(v)[v(2)-((u-l)*c0-q*(c-h)*(v(1)-l))/(u-v(1));
    v(2)-1+(v(1)^2-l^2)*(1-q*(c-h))/(2*v(1)*u-2*l^2)];

v0 = [1.5;0.7];
options = optimset('MaxFunEvals',3e10); % options = optimset('Display','iter','MaxFunEvals',3e3);
[v, fval] = fsolve(SS,v0,options);

x(i) = v(1);
p(i) = v(2);

mu(i) = p(i)/c-1;
y(i) = x(i)*(1-p(i));

R(i) = -(1/(u-l))*(x(i)^2 - 2*u*x(i) + l^2)/(x(i)+l);
Tx(i) = 0.5*(1+l/x(i));

end

i=1:1:10;

figure(1);clf;hold on;
subplot(1,3,1)
plot(0.9+0.01*i,p(i),'-b',0.9+0.01*i,mu(i),'-r')
subplot(1,3,2)
plot(0.9+0.01*i,x(i),'-b',0.9+0.01*i,y(i),'-r')
subplot(1,3,3)
plot(0.9+0.01*i,R(i),'-b',0.9+0.01*i,Tx(i),'-r')

%% c'
for i=1:30
    
    c = c + 0.01;

SS = @(v)[v(2)-((u-l)*c0-q*(c-h)*(v(1)-l))/(u-v(1));
    v(2)-1+(v(1)^2-l^2)*(1-q*(c-h))/(2*v(1)*u-2*l^2)];

v0 = [1.5;0.7];
options = optimset('MaxFunEvals',3e10, 'TolFun',3e10); % options = optimset('Display','iter','MaxFunEvals',3e3);
[v, fval] = fsolve(SS,v0,options);

x(i) = v(1);
p(i) = v(2);

mu(i) = p(i)/c-1;
y(i) = x(i)*(1-p(i));

R(i) = -(1/(u-l))*(x(i)^2 - 2*u*x(i) + l^2)/(x(i)+l);
Tx(i) = 0.5*(1+l/x(i));

end

i=1:1:30;

figure(2);clf;hold on;
subplot(1,3,1)
plot(0.5+0.01*i,p(i),'-b',0.5+0.01*i,mu(i),'-r')
subplot(1,3,2)
plot(0.5+0.01*i,x(i),'-b',0.5+0.01*i,y(i),'-r')
subplot(1,3,3)
plot(0.5+0.01*i,R(i),'-b',0.5+0.01*i,Tx(i),'-r')

%% h'
for i=1:30
    
    h = h + 0.01;

SS = @(v)[v(2)-((u-l)*c0-q*(c-h)*(v(1)-l))/(u-v(1));
    v(2)-1+(v(1)^2-l^2)*(1-q*(c-h))/(2*v(1)*u-2*l^2)];

v0 = [1.5;0.7];
options = optimset('MaxFunEvals',3e10,'TolFun',3e10); % options = optimset('Display','iter','MaxFunEvals',3e3);
[v, fval] = fsolve(SS,v0,options);

x(i) = v(1);
p(i) = v(2);

mu(i) = p(i)/c-1;
y(i) = x(i)*(1-p(i));

R(i) = -(1/(u-l))*(x(i)^2 - 2*u*x(i) + l^2)/(x(i)+l);
Tx(i) = 0.5*(1+l/x(i));

end

i=1:1:30;

figure(3);clf;hold on;
subplot(1,3,1)
plot(0.1+0.01*i,p(i),'-b',0.1+0.01*i,mu(i),'-r')
subplot(1,3,2)
plot(0.1+0.01*i,x(i),'-b',0.1+0.01*i,y(i),'-r')
subplot(1,3,3)
plot(0.1+0.01*i,R(i),'-b',0.1+0.01*i,Tx(i),'-r')
