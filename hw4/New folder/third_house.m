clear all;
close all;
clc;

%%% Senate Data %%%

FID = fopen('C:\Users\harik\Desktop\EAS596\takehome\house_names.txt', 'r');
house_names = textscan(FID , '%s','Delimiter','\n');
fclose(FID);

celldisp(house_names)

house_parties = load('C:\Users\harik\Desktop\EAS596\takehome\house_parties.txt');
house_parties

house_votes = load('C:\Users\harik\Desktop\EAS596\takehome\house_votes.txt');
house_votes




[U,S,V] = svd(house_votes);
% sing_values = diag(S);
% plot(sing_values)
% legend('singular values (house data)');
% xlabel('size of the diagonal matrix')
% ylabel('Magnitude')
% 
% gscatter(U(:,1),U(:,2),house_parties);
% legend('Democrats','Republicans')
% title('scatter plot of the first and second columns of U - HOUSE DATA')
% xlabel('U1')
% ylabel('U2')


[U1,S1,V1]=svd(house_votes);
r=2;
D = U1(:,1:r)*S1(1:r,1:r)*V1(:,1:r)';

D1=round(D);

result=D1==house_votes;
[U2,S2,V2]=svd(D1);  
gscatter(U2(:,1),U2(:,2),senate_names);

legend('Democrats','Republicans')
title('Low rank approximation - HOUSE DATA')
xlabel('U1')
ylabel('U2')
