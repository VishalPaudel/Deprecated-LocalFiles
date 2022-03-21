%% Monte-Carlo simulation : Buffon's needle (short needle case) 
%  Author  : E. Ogier
%  Version : 1.0
%  Release : 5th apr. 2016
%
%  Video Recorder source :
%  http://www.mathworks.com/matlabcentral/fileexchange/56100-video-recorder

% Constants
nl = 1;   % Needle length
wsw = 2;  % Wood strips width
N = 1e3;  % Number of realizations

% Downsampling step for video
Video = 0;
dn = 10;

% Uniform distribution generator
Uniform = @(Min,Max)rand(1,1)*(Max-Min)+Min;

% Monte-Carlo simulator
MCS = MonteCarloSimulator();

% Random variables
MCS.addRandomVariable('Angle',   {Uniform,0,pi/2});  % Needle angle
MCS.addRandomVariable('Distance',{Uniform,0,wsw/2}); % Needle distance

% Intersection indicator
MCS.addFunction('IntersectionIndicator',@(Angle,Distance)gt(nl/2*sin(Angle),Distance));

% Simulation
MCS.simulate(N);

% Indicator realizations
Indicator = MCS.getRealizations('IntersectionIndicator');

% Estimated probability
p = numel(find(Indicator))/N;

% Pi value estimation
pi_estimated = 2 * nl / (wsw*p);

% Display
fprintf('Estimation of "pi" : %g\n',pi_estimated);
fprintf('Relative error : %+.1f%%\n',100*(pi_estimated/pi-1));

%% Graphical representations

% Random variables realizations
Angle    = MCS.getRealizations('Angle');
Distance = MCS.getRealizations('Distance');

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

% Number of realizations
N = numel(Angle);

% Pi estimation
Pi_estimated = zeros(N,1);
for n = 1:N
    ni = numel(find(Indicator(1:n)));
    p = ni/n;
    Pi_estimated(n) = 2 * nl / (wsw*p);
end

% Update
for n = 0:dn:N
    
    switch n
        
        case 0
            
            % Axes #1 
            Axes(1) = subplot(4,1,1:3);            
            box('on');
            hold('on');
            title('Buffon''s needle (short needle case)',...
                'Fontname','Times','FontAngle','Italic',...
                'Fontsize',15,'Fontweight','light');
            xlabel('Needle angle [rad]');
            ylabel('Needle vs wood strip distance [cm]');

            % Intersection condition in term of angle and distance couple
            Angle0 = linspace(0,pi/2,1000);
            Distance0 = nl/2*sin(Angle0);
            
            % Indicator plots
            g = plot(nan,nan,'g.'); % Intersection
            r = plot(nan,nan,'r.'); % No intersection
            
            % Intersection limit
            plot(Angle0,Distance0,'b--');
            
            % Plot legend
            legend({'Intersection','No intersection','Limit'},'Fontsize',10);
            
            % Axes #2            
            Axes(2) = subplot(4,1,4);                      
            box('on');
            hold('on');
            
            % Pi estimated values plot
            Pi_estimated_plot = plot(1:dn,Pi_estimated(1:dn),'b');
            
            % Pi
            Pi_line = plot(1:dn,pi*ones(1,dn),'g');               
            
            % Axes #2 setting
            Legend = legend({sprintf('<\\Pi>'),sprintf('\\Pi')},...
                'Fontsize',10,'Location','NorthWest');          
            xlabel('Number of iterations');
            ylabel('Estimation of \Pi');
            set(Axes(2),'Xscale','log');
            hold('on');
            grid('on');
            box('on');
            
        otherwise
                        
            % Points update
            I = eq(Indicator(1:n),1);
            set(g,'Xdata',Angle(I),'Ydata',Distance(I));
            set(r,'Xdata',Angle(~I),'Ydata',Distance(~I));
            
            % Number of intsersections
            ni = numel(find(Indicator(1:n)));
            
            % Estimated probability
            p = ni/n;
            
            % Pi value estimation
            pi_estimated = 2*nl/(wsw*p);            
            Pi_estimated(n) = pi_estimated;
            
            % Update
            set(Pi_estimated_plot,'Xdata',1:n,'Ydata',Pi_estimated(1:n));            
            set(Pi_line,'Xdata',1:n,'Ydata',pi*ones(n,1));            
            set(Legend,...
                'String',{sprintf('<\\Pi> = %.4f',pi_estimated),...
                          sprintf('\\Pi (\\Delta\\Pi = %+.1f%%)',100*(pi_estimated/pi-1))});
            
            % Refreshment
            drawnow();
        
            if Video, VR.add(); end %#ok<UNRCH> 
            
    end
    
end

if Video, VR.stop(); end %#ok<UNRCH>
