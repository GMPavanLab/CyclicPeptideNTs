clear all
%% pmf
PMF = importdata('pmf.xvg');
r = PMF.data(5:end-20,1);
deltaG = PMF.data(5:end-20,2);
deltaG = deltaG - deltaG(end);
[min,pos] = min(deltaG);
%% pmf plot
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(r,deltaG,...
    'MarkerFaceColor',[0.0784313753247261 0.168627455830574 0.549019634723663],...
    'Marker','diamond',...
    'Color',[0.0784313753247261 0.168627455830574 0.549019634723663]);

% Create ylabel
ylabel('\DeltaG [kJ/mol]');

% Create xlabel
xlabel('d [nm]');

box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontSize',16);
%% Histo
Histo = importdata('histo.xvg');
[row,coul] = size(Histo.data);
rh = Histo.data(:,1);
% Create figure
figure2 = figure;

% Create axes
axes2 = axes('Parent',figure2);
hold(axes2,'on');

for i=2:coul
Count = Histo.data(:,i);
plot(rh,Count,'LineWidth',2);hold on
end

% Create ylabel
ylabel('count');

% Create xlabel
xlabel('d [nm]');

box(axes2,'on');
% Set the remaining axes properties
set(axes2,'FontSize',16);