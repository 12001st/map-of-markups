clear all
close all

%draw a figure of hedge and offer conditions over the plane of (markup, xhat) = (mu,xh)

%% compare (a,m) = (0.1, 0.3) vs (0.9, 0.6) in response to lower bound shock (SSD)
% with case  (a,m) = (0.1, 0.3), SSD shock gives countercyclical markups, 
% with case (a,m)=(0.9,0.6) SSD gives rise to procyclical markups

%parameterization
l=0; %lower bound of the uniform distribution for x
u=5; %upper bound of the uniform distribution for x
a=0.1;  %a = h/c; marginal costs ratio
m=0.1; % market power 1/el

xh=[l:0.01:u];

R=-(1/(u-l))*(xh.^2 - 2*u*xh + l^2)./(xh+l);
F=(xh-l)./(u-l);
muo=(1+F./(1-F)).*(1-a*F);
muh=1./(1-m*R);

figure(1); hold on
plot(xh,muo,'-b',xh,muh,'-r'); %draw a curve without taking into account of the restriction about xtilde
axis([0 3 1 5]);
xlabel('xhat')
ylabel('mu')

%% 
l=0; %lower bound of the uniform distribution for x
u=1.5; %upper bound of the uniform distribution for x
%a=0.9;
%m=0.2;

xh=[l:0.01:u];

R=-(1/(u-l))*(xh.^2 - 2*u*xh + l^2)./(xh+l);
F=(xh-l)./(u-l);
muo=(1+F./(1-F)).*(1-a*F);
muh=1./(1-m*R);

figure(2); hold on
plot(xh,muo,'-b',xh,muh,'-r'); %draw a curve without taking into account of the restriction about xtilde
axis([0 3 1 5]);
xlabel('xhat')
ylabel('mu')

