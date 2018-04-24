clear
close all
clc

x = [0,1,2,3,4,5,6];
y = [-0.02,1.1,1.98,3.05,3.95,5.1,6.02];

poly1=polyfit(x,y,1);
poly2=polyfit(x,y,2);
plot(x,y,'o')
hold on
plot(x,polyval(poly1,x),'r-')
plot(x,polyval(poly2,x),'b--')


yfit1 = polyval(poly1,x);
yresid1 = y - yfit1;
SSresid1 = sum(yresid1.^2);
SStotal1 = (length(y)-1) * var(y);
rsq1 = 1 - SSresid1/SStotal1;
rsq1;

rsq_adj1 = rsq1 * (length(y)-1)/(length(y)-length(poly1));
rsq_adj1;

yfit2 = polyval(poly2,x);
yresid2 = y - yfit2;
SSresid2 = sum(yresid2.^2);
SStotal2 = (length(y)-1) * var(y);
rsq2 = 1 - SSresid2/SStotal2;
rsq2;

rsq_adj2 = rsq2 * (length(y)-1)/(length(y)-length(poly2));
rsq_adj2;