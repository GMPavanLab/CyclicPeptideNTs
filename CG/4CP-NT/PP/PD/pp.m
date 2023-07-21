clear all
%close all
t=10;       %total tubes COmbinazione= 190 cases
nt = linspace(1,t,t);
r=0;
y=0;
g=0;
nc0 = 0;
%% plot
% Create figure
figure1 = figure(1);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% Create ylabel
ylabel('# TRP-TRP contacts ');

% Create xlabel
xlabel('cos(\Theta)');

box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontSize',18);
%%

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
        cd ncont
        filename = strcat(nti,ntj,'.xvg');
        NC = importdata(filename,' ',24);
        NCdata= NC.data(:,2);
        NC_mean = mean(NCdata(3000:3010));
        NC_std = std(NCdata(3000:3010));
        nc(ll)=NC_mean;
    cd ../nvect
    filename = strcat('vect_',nti,ntj,'.xvg');
    angle = importdata(filename,' ',24);
    Adata = angle.data(:,2);
    A_mean = mean(Adata(3000:3010));
    A_std =  std(Adata(3000:3010));
    Ar_mean=2*pi*A_mean/360;
    cosa(ll)=abs(cos(Ar_mean));

    j = j+1;
    cd ..
    end
% Create figure
figure(1)
for k = 1:length(cosa)
    if nc(k)==0
        nc0 = nc0+1;
     end
    if cosa(k)>=0.9
        r=r+1;
        plot(cosa(k),nc(k),'MarkerFaceColor',[0.635294139385223 0.0784313753247261 0.184313729405403],...
            'MarkerEdgeColor',[0 0 0],...
            'MarkerSize',20,...
            'Marker','o',...
            'LineStyle','none',...
            'Color',[0.635294139385223 0.0784313753247261 0.184313729405403]);
        
    elseif cosa(k) < 0.9 && cosa(k)>=0.5 
        g=g+1;
        plot(cosa(k),nc(k),'MarkerFaceColor',[0.635294139385223 0.0784313753247261 0.184313729405403],...
            'MarkerEdgeColor',[0 0 0],...
            'MarkerSize',20,...
            'Marker','o',...
            'LineStyle','none',...
            'Color',[0.635294139385223 0.0784313753247261 0.184313729405403]);
    elseif   cosa(k)<0.5 
        y=y+1;
        plot(cosa(k),nc(k),'MarkerFaceColor',[0.635294139385223 0.0784313753247261 0.184313729405403],...
            'MarkerEdgeColor',[0 0 0],...
            'MarkerSize',20,...
            'Marker','o',...
            'LineStyle','none',...
            'Color',[0.635294139385223 0.0784313753247261 0.184313729405403]);
    end
end
figure(2);
for k = 1:length(cosa)
    if nc(k)==0
        nc0 = nc0+1;
     end
    if cosa(k)>=0.85
        Adata =2*pi*Adata/360;
        costheta = abs(cos(Adata));
        time = angle.data(:,1);
        plot(time,costheta);hold on;
    end
end

hold on
clear cosa nc
end
fr=r/45;
fg=g/45;
fy=y/45;
fnc = nc0/45;
    