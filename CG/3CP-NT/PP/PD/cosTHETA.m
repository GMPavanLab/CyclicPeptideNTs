clear all
%close all
t=14;       %total tubes COmbinazione= 190 cases
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
    while j <= 14
        ll=ll+1;
        nti = strcat('nt',num2str(i),'-');
        ntj = strcat('nt',num2str(j));
        cd nvect
    filename = strcat('vect_',nti,ntj,'.xvg');
    angle = importdata(filename,' ',24);
    Adata = angle.data(:,2);
    Adata =2*pi*Adata/360;
    costheta = abs(cos(Adata));
%     cos_final= mean(costheta(end-10:end));
%     if cos_final>0.85
       c=c+1;
       COS(:,c)=costheta;
%     end
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
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% Create ylabel
ylabel('cos(\Theta)');

% Create xlabel
xlabel('Time (s)');

box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontSize',18);
plot(Time*1e-12,cos_average,'LineWidth',4,...
    'Color',[0.87058824300766 0.921568632125854 0.980392158031464]);hold on

plot(Time*1e-12,cos_av_smooth,'LineWidth',2,'Color',[0.0784313753247261 0.168627455830574 0.549019634723663]);hold on
fr=r/45;
fg=g/45;
fy=y/45;
fnc = nc0/45;
    