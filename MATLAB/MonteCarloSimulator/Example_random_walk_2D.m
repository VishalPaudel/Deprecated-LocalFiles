%% Monte-Carlo simulation : bidimensional random walk
% 
%  Video Recorder source :
%  http://www.mathworks.com/matlabcentral/fileexchange/56100-video-recorder

% Number of random steps
N = 1000;

% Video record indicator
Video = 0;

% Binomial distribution noise generator (rate random walk source)
Binomial = @(s)(2*ge(rand(1,1),1/2)-1)*s;
s0 = 1;

% Monte-Carlo simulator
MCS = MonteCarloSimulator();

% Random step
MCS.addRandomVariable('RandomAbscissaStep',{Binomial,s0});
MCS.addRandomVariable('RandomOrdinateStep',{Binomial,s0});

% Previous coordinates
MCS.addFunctionBuffer('PreviousAbscissa','Abscissa',0);
MCS.addFunctionBuffer('PreviousOrdinate','Ordinate',0);

% Coordinates
MCS.addFunction('Abscissa',@(PreviousAbscissa,RandomAbscissaStep)PreviousAbscissa+RandomAbscissaStep);
MCS.addFunction('Ordinate',@(PreviousOrdinate,RandomOrdinateStep)PreviousOrdinate+RandomOrdinateStep);

% Monte-Carlo simulation
MCS.simulate(N);

% Coordinates
Abscissa = getRealizations(MCS,'Abscissa');
Ordinate = getRealizations(MCS,'Ordinate');
Abscissa = [0; Abscissa];
Ordinate = [0; Ordinate];

% Figure
Figure = figure('Color','w');

% Video recorder
if Video
    VR = VideoRecorder('Filename','RW','Figure',Figure); %#ok<UNRCH>
end

% Full screen
drawnow;
warning('off','all');
jFrame = get(Figure,'JavaFrame');
jFrame.setMaximized(true);
warning('on','all');
pause(0.1);

% Plot
plot(0,0,'ro'); hold('on');
Walk = stairs(0,0,'b-');
CC = plot(nan,nan,'go');
axis('equal');
title('Bidimensional random walk',...
      'Fontname', 'Times', 'FontAngle',  'Italic',...
      'Fontsize',  15,     'Fontweight', 'Light');
Legend = legend({'Origin','Walk (0 steps)','Current position'});

% Plot update
for n = 1:N    
    set(Walk,'Xdata',Abscissa(1:n),'Ydata',Ordinate(1:n));
    set(CC,'Xdata',Abscissa(n),'Ydata',Ordinate(n));
    set(Legend,'String',{'Origin',sprintf('Walk (%u steps)',n),'Current position'});
    drawnow();    
   
    if Video, VR.add(); end %#ok<UNRCH>
    
end

if Video, VR.stop(); end %#ok<UNRCH>
