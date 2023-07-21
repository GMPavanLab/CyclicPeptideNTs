clear all
%%
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
    Nclus = importdata('nclust.xvg',' ',17);
    MaxSize = importdata('maxclust.xvg',' ',17);
%    Eigh = importdata('polystat.xvg',' ',28);
    
    time = Nclus.data(1:end,1);
    time = time*1e-12;
    Nc = Nclus.data(1:end,2);
        Nc_smooth=movmean(Nc,500);
    MaxS = MaxSize.data(1:end,2);
%     EV = Eigh.data(end,4:6);
% Ab(i) = ((EV(1)-EV(2))^2+(EV(1)-EV(3))^2+(EV(2)-EV(3))^2)/(2*(EV(1)+EV(2)+EV(3))^2);
% Ah (i)= 1-(3*((EV(1)*EV(2)+EV(1)*EV(3)+EV(2)*EV(3))/((EV(1)+EV(2)+EV(3))^2)));

Nmol_end = MaxS(end);
Nc_end = Nc(end);
%% plot
plot(time,Nc,'MarkerSize',2,...
    'LineWidth',2,...
    'Marker','diamond');hold on
plot(time,Nc_smooth,'MarkerSize',2,...
    'LineWidth',2,...
    'Marker','diamond');
hold on
%% plot 1
% Create ylabel
ylabel('# of clusters');

% Create xlabel
xlabel('Time [s]');

% Uncomment the following line to preserve the X-limits of the axes
%xlim(axes1,[0 2.5e-6]);
% Uncomment the following line to preserve the Y-limits of the axes
%ylim(axes1,[0 21]);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontSize',16,'YMinorTick','on');
% Create legend
legend1 = legend(axes1,'show');


