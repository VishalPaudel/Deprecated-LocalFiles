%% Monte-Carlo simulation : german tank problem
%   Estimation of the total number of tanks engaged in a battle on the basis
%   of losses number and the maximum serial number (Bayesian inference)
%  Author  : E. Ogier
%  Version : 1.0
%  Release : 5th apr. 2016
% 
%  Video Recorder source :
%  http://www.mathworks.com/matlabcentral/fileexchange/56100-video-recorder

% Number of battles
N = 1000;

% Number of tanks
T = 300;

% Video record indicator
Video = 0;

% Loss rate interval per battle (+/- 2* standard deviation)
Loss_rates = [10 20]/100;

% Uniform distribution noise generator
UDNGenerator = @(Min,Max)round(rand(1,1)*(Max-Min)+Min);

% Normal distribution noise generator
NDNGenerator = @(m,s)m+2*(rand(1,1)-1/2)*s;

% Monte-Carlo simulator
MCS = MonteCarloSimulator();

% Random variables
MCS.addRandomVariable('Kills',{NDNGenerator,T*mean(Loss_rates),T*diff(Loss_rates)/2});     % Number of kills
MCS.addFunction('SerialNumberMax',...
    @(Kills)max(cell2mat(arrayfun(@(~)UDNGenerator(1,T),1:Kills,'UniformOutput',false)))); % Maximum serial number
MCS.addFunction('EstimationTanks',...
    @(SerialNumberMax,Kills)SerialNumberMax-1+SerialNumberMax/Kills);                      % Estimation of tanks number

% Simulation
MCS.simulate(N);

% Realizations
Kills = MCS.getRealizations('Kills');                     % Number of kills
SerialNumberMax = MCS.getRealizations('SerialNumberMax'); % Maximum serial number
EstimationTanks = MCS.getRealizations('EstimationTanks'); % Estimated number of tanks engaged in battle

% Data sorting for plot stability
[Kills,I] = sort(Kills);
SerialNumberMax = SerialNumberMax(I);
EstimationTanks = EstimationTanks(I);

% Figure
Figure = figure('Color','w');

% Video recorder
if Video
    VR = VideoRecorder('Filename','German_tank_problem','Figure',Figure); %#ok<UNRCH>
end

% Full screen
drawnow;
warning('off','all');
jFrame = get(Figure,'JavaFrame');
jFrame.setMaximized(true);
warning('on','all');
pause(0.1);

% Axes #1
Axes(1) = subplot(4,1,1);
set(Axes(1),...
    'Xlim',T*Loss_rates,...
    'Xcolor','r','Ycolor','b');
Color = 0.7*[1 1 1];

% Patches
Patch_SN0 = ...
    patch('Faces',               [1 2 3],...
          'Vertices',            [0 0;0 T;T T],...
          'EdgeColor',           Color,...
          'FaceVertexAlphaData', 0.9,...
          'FaceColor',           [0.95 0.95 1]);
Patch_SN = ...
    patch('Faces',               [1 2 3],...
          'Vertices',            [0 0;0 T;T T],...
          'EdgeColor',           Color,...
          'FaceVertexAlphaData', 0.9,...
          'FaceColor',           [0.8 0.8 1]);
Patch_tanks_g = ...
    patch('Faces',               [1 2 3],...
          'Vertices',            [0 0;T 0;T T],...
          'EdgeColor',           Color,...
          'FaceVertexAlphaData', 0.9,...
          'FaceColor',           [0.8 1 0.8]);
Patch_tanks_r = ...
    patch('Faces',               [1 2 3],...
          'Vertices',            [0 0;0 0;0 0],...
          'EdgeColor',           Color,...
          'FaceVertexAlphaData', 0.9,...
          'FaceColor',[1 0.8 0.8]);
title('German tank problem',...
      'Fontname', 'Times', 'FontAngle',  'Italic',...
      'Fontsize',  15,     'Fontweight', 'Light');
xlabel('Sorted losses [tank]','Color','r');
ylabel('Tank S/N_m_a_x','Color','b');
box('on');

% Axes #2
Axes(2) = subplot(4,1,2:4);
Plot_T0 = plot(nan,nan,'g'); hold('on');
Plot_T = plot(nan,nan,'b');
Plot_Tm = plot(nan,nan,'b--');
legend({'True','Estimated','Mean'},'Location','SouthWest','Orientation','Horizontal');
xlabel('Battle #')
ylabel('Number [tank]');
box('on');

% Mean estimation
MeanEstimationTanks = zeros(N,1);
MeanEstimationTanks(1) = EstimationTanks(1);

for n = 1:N
    
    % Realizations
    sn = SerialNumberMax(n);
    k = Kills(n);
    
    % Serial number
    set(Patch_SN,'Vertices',[0 0;0 k;k k]);
    set(Axes(1),'Ytick',k,'YtickLabel',sprintf('%u',sn));
       
    % Losses rate
    set(Patch_tanks_r,'Vertices',[0 0;k 0;k k]);
    set(Axes(1),'Xlim',T*Loss_rates,'Ylim',T*Loss_rates);
    
    % Estimation of tanks number
    set(Plot_T0,'Xdata',[1 n],'Ydata',[T T]);
    set(Plot_T,'Xdata',1:n,'Ydata',EstimationTanks(1:n));
    
    % Mean value
    if n > 1
        MeanEstimationTanks(n) = ((n-1)*MeanEstimationTanks(n-1)+EstimationTanks(n))/n;    
        set(Plot_Tm,'Xdata',1:n,'Ydata',MeanEstimationTanks(1:n));
    end
    
    drawnow();
    
    if Video, VR.add(); end %#ok<UNRCH>
    
end

if Video, VR.stop(); end %#ok<UNRCH>
