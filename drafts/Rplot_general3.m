clear all;
close all;
clc;
%% Choose figures
flag_plot = 1;
% 1: Convex technologies
% 2: Explicit benefits and costs in XD
% 3: Risk aversion
% 4: Additive demand

%% Set parameters
%%%% distribution F, discount q, competition phi, all to be set in each correspongind section below

%% Example // Offer and Hedge curves
%%%%% Set business environments %%%%%
q=1;
phi=1;

%%%%% Set sector location %%%%%
u=3;
l=1;
cc=1;
%m=0.25;
%h=0.5;
alp=2;
iter=1000;
A=10;

mm=[0.01:0.01:0.5];
hh=[0.01:0.01:0.99];
s=1;
for ii=1:length(mm)
    for jj=1:length(hh)
m=mm(1,ii);
h=hh(1,jj);
c=[cc m h alp u l A];

  x = fsolve(@(x) myfun_convex(x,c), [(u+l)/2;(alp*((u+l)/2)^(alp-1)*A)^(1/(1+1/m*(alp-1)))],optimoptions('fsolve','MaxIter',iter));
xx(s,1)=x(1);  %quantity 
xp(s,1)=x(2);  %price
xc(s,1)=alp*(A*x(1).*x(2)^(-1/m))^(alp-1); %marginal costs
s=s+1;
    end
end
mu=xp./xc; %markup

rx=2*xx./(xx+l).*(u-xx)./(u-l)+(xx-l)./(u-l);
xx4=1./(1-mm.*rx);
dxx=mu-xx4;


%shocks
mm=[0.01:0.01:0.5];
hh=[0.01:0.01:0.99]*1.1;

s=1;
for ii=1:length(mm)
    for jj=1:length(hh)
m=mm(1,ii);
h=hh(1,jj);
c=[cc m h alp u l A];

  x = fsolve(@(x) myfun_convex(x,c), [(u+l)/2;(alp*((u+l)/2)^(alp-1))^(1/(1+1/m*(alp-1)))],optimoptions('fsolve','MaxIter',iter));
xxa(s,1)=x(1);
xpa(s,1)=x(2);
xca(s,1)=alp*(A*x(1).*x(2)^(-1/m))^(alp-1);
    end
end
mua=xpa./xca;

rxa=2*xxa./(xxa+l).*(u-xxa)./(u-l)+(xxa-l)./(u-l);
xx4a=1./(1-mm.*rxa);
dxxa=mua-xx4a;

stop


dm=mua-mu; %markup difference
dmp=100*(mua-mu)./mu;
dx=xxa-xx; %quantity difference



%plot(xx2, rx)
%hold on
xx2a=[]
xx3a=[]
for i=1:length(xxa(1,:))
xx2a=[xx2a; xxa(:,i)];
xx3a=[xx3a; mua(:,i)];

end
%xx2a=sort(xx2a);
rxa=2*xx2a./(xx2a+l).*(u-xx2a)./(u-l)+(xx2a-l)./(u-l);
xx4a=1./(1-m.*rxa);
dxxa=xx3a-xx4a; %check cchhchhttttt
dmr=xx4a-xx4; %markup difference

%calculate markup using the risk factors
rxm=2*xx./(xx+l).*(u-xx)./(u-l)+(xx-l)./(u-l);
xx4m=1./(1-m.*rxm);
rxma=2*xxa./(xxa+l).*(u-xxa)./(u-l)+(xxa-l)./(u-l);
xx4ma=1./(1-m.*rxma);

drxm=xx4ma-xx4m;
