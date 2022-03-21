%% Monte-Carlo simulation : gyroscope
%   Gyroscope measuring Earth rotation rate with random walk type noise
%   Alignment of gyroscope sensitive axe and Earth rotation axe
%  Author  : E. Ogier
%  Version : 1.0
%  Release : 5th apr. 2016
%
%  Video Recorder source :
%  http://www.mathworks.com/matlabcentral/fileexchange/56100-video-recorder

% Number of realizations
N = 1e3;

% Downsampling step for video
Video = 0;
dn = 10;

% Gyroscope initial angle
a0 = 0;

% Angular rate white noise standard deviation [rad/s]
s0 = 1e-7;

% Earth rotation rate [rad/s]
We = 360/24*pi/180/3600;

% Gyrometer digital sampling period (1ms)
Ts = 1e-3;

% Normal distribution noise generator
NoiseGenerator = @(s)2*(rand(1,1)-1/2)*s;

%% Simulation

% Monte-Carlo simulator
MCS = MonteCarloSimulator();

% Random functions
MCS.addFunctionBuffer('PreviousTime','Time',0);                    % Time buffer
MCS.addFunction('Time',@(PreviousTime)PreviousTime+Ts);            % Time function, periods integration
MCS.addFunctionBuffer('PreviousAngle','Angle',a0);                 % Angle buffer, angle increments summation
MCS.addFunction('AngleIncrement',@(Time)We*Ts+NoiseGenerator(s0)); % Angle increment function, additive white noise
MCS.addFunction('Angle',...
    @(PreviousAngle,AngleIncrement)PreviousAngle+AngleIncrement);  % Resulting angle

% Monte-Carlo simulation
MCS.simulate(N);

% Gyroscope angle
Angle = getRealizations(MCS,'Angle');

% Reference angle
RefAngle = a0+(1:N)'*We*Ts;

% Angular error
AngularError = Angle-RefAngle;

%% Graphical representation

% Figure
Figure = figure('Color','w');

% Video recorder
if Video
    VR = VideoRecorder('Filename','Gyro','Figure',Figure); %#ok<UNRCH>
end

% Full screen
drawnow;
warning('off','all');
jFrame = get(Figure,'JavaFrame');
jFrame.setMaximized(true);
warning('on','all');
pause(0.1);

% Angles comparison
ra = plot(nan,nan,'g-'); hold('on');
[Ax,ga,ea] = plotyy(nan,nan,nan,nan); hold(Ax(2),'on');
z = plot(Ax(2),[0 1],[0 0],'r--','Linewidth',1);
Red = [1 0.7 0.7];
Ax(1).YColor = 'b';
Ax(2).YColor =  Red;
ga.Color = 'b';
ea.Color = Red;
ea.LineStyle = '-';
legend({'Reference angle (\Omega_E_a_r_t_h = 15°/h)',...
        'Gyroscope angle @ \Omega_E_a_r_t_h',...
        'Gyroscope error (RW only)'},...
       'Location','NorthWest');
title('Gyroscope',...
      'Fontname','Times','FontAngle','Italic',...
      'Fontsize',15,'Fontweight','light');
xlabel('Time [ms]');
ylabel(Ax(1),'Angle [rad]');
ylabel(Ax(2),'Angular error [rad]');
grid(Ax(1),'on');

% Plot update
for n = 1:dn:N
    
    I = 1:n;
    set(ga,'Xdata',I*Ts,'Ydata',Angle(I));
    set(ea,'Xdata',I*Ts,'Ydata',AngularError(I));
    set(ra,'Xdata',I*Ts,'Ydata',RefAngle(I));   
    set(z, 'Xdata',[1 n]*Ts);
    if n > 1
        set(Ax,'Xlim',[1 n]*Ts);
        set(Ax(1),'Ylim',[min(RefAngle(I)) max(RefAngle(I))]);
        set(Ax(2),'Ylim',[min(AngularError(I)) max(AngularError(I))]);
        set(Ax,'YTickMode','Auto');
    end
    drawnow();
    
    if Video, VR.add(); end %#ok<UNRCH>
    
end

if Video, VR.stop(); end %#ok<UNRCH>
