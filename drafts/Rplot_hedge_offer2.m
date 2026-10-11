clear all;
close all;
clc;

%% Choose cases
flag_case = 2;
% 1: Convex technologies
% 2: Explicit benefits and costs in XD
% 3: Risk aversion
% 4: Additive demand

%% Convex technologies
if flag_case==1;

%%%%% Set business environments %%%%%
q=1;
phi=1;
%%%%% Set sector location %%%%%

c=1;
alp=1;
iter=1000;
A=10;
s=1;
h=0.2;
m=0.2;
s1=2;
s2=1;
u=s1+sqrt(3)*s2;
l=s1-sqrt(3)*s2;
x=[l:0.01:u];
hp=-0.5*(h/m)*(x.^2-l^2)./(x.*(u-x)+(1-1/m)*0.5*(x.^2-l^2));
op=(c-h.*(x-l)./(u-l)).*(u-l)./(u-x);

h=0.9;
m=0.5;
s1=2;
s2=1;
u=s1+sqrt(3)*s2;
l=s1-sqrt(3)*s2;
x=[l:0.01:u];
hp5=-0.5*(h/m)*(x.^2-l^2)./(x.*(u-x)+(1-1/m)*0.5*(x.^2-l^2));
op5=(c-h.*(x-l)./(u-l)).*(u-l)./(u-x);



s1=2.0;
s2=0.9;
u2=s1+sqrt(3)*s2;
l2=s1-sqrt(3)*s2;
hp2=-0.5*(h/m)*(x.^2-l2^2)./(x.*(u2-x)+(1-1/m)*0.5*(x.^2-l2^2));
op2=(c-h.*(x-l2)./(u2-l2)).*(u2-l2)./(u2-x);


%{
h=0.6;
m=0.5;
s1=2;
s2=1;
u=s1+sqrt(3)*s2;
l=s1-sqrt(3)*s2;
x=[l:0.01:u];
hp3=-0.5*(h/m)*(x.^2-l^2)./(x.*(u-x)+(1-1/m)*0.5*(x.^2-l^2));
op3=(c-h.*(x-l)./(u-l)).*(u-l)./(u-x);


s1=2;
s2=0.9;
u2=s1+sqrt(3)*s2;
l2=s1-sqrt(3)*s2;
hp4=-0.5*(h/m)*(x.^2-l2^2)./(x.*(u2-x)+(1-1/m)*0.5*(x.^2-l2^2));
op4=(c-h.*(x-l2)./(u2-l2)).*(u2-l2)./(u2-x);
%}

figure(1);hold on;
plot(x,hp,'-b')
plot(x,hp5,'-r')

%plot(x,op,'-r')
%plot(x,hp2,'-.b')
%plot(x,op2,'-.r')

%plot(x,hp3,'-y')
%plot(x,op3,'-k')
%plot(x,hp4,'-.y')
%plot(x,op4,'-.k')

axis([0.5 5 1 5]);

end



if flag_case==2;

%%%%% Set business environments %%%%%
q=1;
phi=1;
%%%%% Set sector location %%%%%
dd=5;
bb=1;
c=1;
alp=1;
iter=1000;
A=10;
s=1;
h=0.2;
m=0.2;
s1=2;
s2=1;
u=s1+sqrt(3)*s2;
l=s1-sqrt(3)*s2;
x=[l:0.01:u];

hp = 0.5*(dd-bb*cc+x.*(u-x)./(u-1)+0.5*(x.^2-l^2)./(u-l))/b;
op = (c*(u-l)-h*(x-l))./(u-x);

%{
h=0.9;
m=0.5;
s1=2;
s2=1;
u=s1+sqrt(3)*s2;
l=s1-sqrt(3)*s2;
x=[l:0.01:u];
hp5=-0.5*(h/m)*(x.^2-l^2)./(x.*(u-x)+(1-1/m)*0.5*(x.^2-l^2));
op5=(c-h.*(x-l)./(u-l)).*(u-l)./(u-x);
%}


s1=2.0;
s2=0.9;
u2=s1+sqrt(3)*s2;
l2=s1-sqrt(3)*s2;
hp2=-0.5*(h/m)*(x.^2-l2^2)./(x.*(u2-x)+(1-1/m)*0.5*(x.^2-l2^2));
op2=(c-h.*(x-l2)./(u2-l2)).*(u2-l2)./(u2-x);


%{
h=0.6;
m=0.5;
s1=2;
s2=1;
u=s1+sqrt(3)*s2;
l=s1-sqrt(3)*s2;
x=[l:0.01:u];
hp3=-0.5*(h/m)*(x.^2-l^2)./(x.*(u-x)+(1-1/m)*0.5*(x.^2-l^2));
op3=(c-h.*(x-l)./(u-l)).*(u-l)./(u-x);


s1=2;
s2=0.9;
u2=s1+sqrt(3)*s2;
l2=s1-sqrt(3)*s2;
hp4=-0.5*(h/m)*(x.^2-l2^2)./(x.*(u2-x)+(1-1/m)*0.5*(x.^2-l2^2));
op4=(c-h.*(x-l2)./(u2-l2)).*(u2-l2)./(u2-x);
%}

figure(1);hold on;
plot(x,hp,'-b')
plot(x,op,'-r')
%plot(x,hp2,'-.b')
%plot(x,op2,'-.r')

%plot(x,hp3,'-y')
%plot(x,op3,'-k')
%plot(x,hp4,'-.y')
%plot(x,op4,'-.k')

axis([0.5 5 1 5]);

end