clear all
close all
t=7;       %total tubes COmbinazione= 190 cases
nt = linspace(1,t,t);
r=0;
y=0;
g=0;
nc0 = 0;

%%
c = 0;
for i = 1:t
    j = i+1;
    l=t-i;
    ll=0;
    nc=ones(1,l);
    cosa=ones(1,l);
    while j <= 7
        ll=ll+1;
        nti = strcat('nt',num2str(i),'-');
        ntj = strcat('nt',num2str(j));
    cd ncont
        filename = strcat(nti,ntj,'.xvg');
        NC = importdata(filename,' ',24);
        NCdata= NC.data(:,2);
        NC_mean = mean(NCdata(end-50:end));
        NC_std = std(NCdata(end-50:end));
        nc(ll)=NC_mean;   
       c=c+1;
       ncontact(:,c)=NCdata;
    j = j+1;
    cd ..
    end
end
Time = NC.data(:,1);
for tm = 1:length(Time)
    cont_average(tm)=mean(ncontact(tm,:));
end
cont_av_smooth=movmean(cont_average,500);

%%
cd ../Nclus
filename = 'avclust.xvg';
AC = importdata(filename,' ',17);
avclus = AC.data(:,2);
avclus_smooth=movmean(avclus,500);
avclus_smooth=avclus_smooth/30;
%% plot
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% Create ylabel
ylabel('cluster size');

% Create xlabel
xlabel('cos\Theta');

box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontSize',18);
plot(cont_av_smooth,avclus_smooth,'LineWidth',2,...
    'Color',[0.87058824300766 0.921568632125854 0.980392158031464]);hold on

% General model:
%      f(x) = 1200/(1+exp(-b*x+c))+d
% Coefficients (with 95% confidence bounds):
%        b =       82.15  (80.02, 84.28)
%        c =       42.28  (41.19, 43.37)
%        d =     0.06566  (-1.706, 1.837)




