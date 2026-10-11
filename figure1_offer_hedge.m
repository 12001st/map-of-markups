clear all;
close all;

%draw a figure of hedge and offer conditions
%Figure 1 of the paper (Example 1: d = x(1-p), x ~ Uniform[l,u], h = 0)

%parameterization
l=0.5; %lower bound of the uniform distribution for x
u=2.0; %upper bound of the uniform distribution for x
c=0.5; %marginal cost


Y=area([l u], [1 1]);
set(gca,'Layer','top');
set(Y,'FaceColor',[0.8 0.8 0.8]);
%set(gcf,'Color',[1 1 1]);
hold all;

x=-2*l:0.01:2*u;

po=c*(u-l)./(u-x);
plot(x,po,'-k','LineWidth',2);

ph=1-(x.^2-l^2)./2./(u*x-l^2);
plot(x,ph,'-k','LineWidth',2);

%axis([-.5*l 1.5*u -1 1.5]);
axis([-0.5 3 -1 2]);
axis square;

%refline(0,0);
%hline1=refline([0,0]);
%set(hline1,'Color','b','LineStyle',':')
yline([0 1],':b');
%refline(0,c);
%hline2=refline([0,c]);
%set(hline2,'Color','r','LineStyle',':')
xline([l u],':b');








