clear all;
close all;
clc;

%%% Senate Data %%%

FID = fopen('C:\Users\harik\Desktop\EAS596\takehome\senate_names.txt', 'r');
senate_names = textscan(FID , '%s','Delimiter','\n');
fclose(FID);

celldisp(senate_names)

senate_parties = load('C:\Users\harik\Desktop\EAS596\takehome\senate_parties.txt');
senate_parties

senate_votes = load('C:\Users\harik\Desktop\EAS596\takehome\senate_votes.txt');
senate_votes



[U,S,V] = svd(senate_votes);
% sing_values = diag(S);
% plot(sing_values)
% legend('singular values (senate data)');
% xlabel('size of the diagonal matrix')
% ylabel('Magnitude')
% 
% gscatter(U(:,1),U(:,2),senate_parties);
% legend('Democrats','Republicans','Independent')
% title('scatter plot of the first and second columns of U - SENATE DATA')
% xlabel('U1')
% ylabel('U2')

[U1,S1,V1]=svd(senate_votes);
r=2;
D = U1(:,1:r)*S1(1:r,1:r)*V1(:,1:r)';

D1=round(D);

result=D1==senate_votes;

% for i=1:100
%     for j=1:486
%         if D(i,j)== senate_votes(i,j)
%             result(i,j)=1;
%     correct = correct+1;
%         else
%             wrong = wrong+1;
%             result(i,j)=0;   
%         end
%     j=j+1;
%     end
%     i=i+1;
% end
[U2,S2,V2]=svd(D1);    
gscatter(U2(:,1),U2(:,2),senate_names);
title('Low rank approximation - SENATE DATA')
legend('Democrats','Republicans','Independent')
xlabel('U1')
ylabel('U2')




