clear all
%close all
t=10;       %total tubes COmbinazione= 190 cases
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
    while j <= 10
        ll=ll+1;
        nti = strcat('nt',num2str(i),'-');
        ntj = strcat('nt',num2str(j));
        cd nvect
    filename = strcat('vect_',nti,ntj,'.xvg');
    angle = importdata(filename,' ',24);
    Adata = angle.data(:,2);
    Adata =2*pi*Adata/360;
    costheta = abs(cos(Adata));
       c=c+1;
       COS(:,c)=costheta;
    j = j+1;
    cd ..
    end
end
Time = angle.data(:,1);
for tm = 1:length(Time)
    cos_average(tm)=mean(COS(tm,:));
end
cos_av_smooth=movmean(cos_average,1000);

%%
cd ../Nclus
filename = 'avclust.xvg';
AC = importdata(filename,' ',17);
avclus = AC.data(:,2);
avclus_smooth=movmean(avclus,1000);
avclus_smooth=avclus_smooth/120;
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
plot(cos_av_smooth,avclus_smooth,'LineWidth',2,...
    'Color',[0.87058824300766 0.921568632125854 0.980392158031464]);hold on

% General model:
%      f(x) = 8/(1+exp(-a*x+b))+2
% Coefficients (with 95% confidence bounds):
%        a =       74.73  (73.85, 75.62)
%        b =       39.22  (38.76, 39.68)
% 
% Goodness of fit:
%   SSE: 607.3
%   R-square: 0.9763
%   Adjusted R-square: 0.9763
%   RMSE: 0.3065
% 
% 
% 
a =       74.73  %(73.85, 75.62);
b =       39.22  %(38.76, 39.68);
x = linspace(0.4,1,6468);
for f = 1:length(x)
fit(f) = 8/(1+exp(-a*x(f)+b))+2;
end
plot(x,fit);hold on
