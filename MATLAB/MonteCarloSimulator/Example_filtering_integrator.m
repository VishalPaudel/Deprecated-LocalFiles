%% Monte-Carlo simulation : Integrator in presence of normal distribution noise
%  Author  : E. Ogier
%  Version : 1.0
%  Release : 5th apr. 2016

% Number of realizations
N = 200;

% Integration step
Step0 = 1;

% Normal distribution noise standard deviation
Sigma0 = 1/2;

% Meaning average mask lengthes
n1 = 5;
n2 = 20;

% Normal distribution noise generator
NoiseGenerator = @(s)2*(rand(1,1)-1/2)*s;

% Monte-Carlo simulator
MCS = MonteCarloSimulator();

% Random step (deterministic step with additive normal distribution noise)
MCS.addRandomVariable('Step',{@(Step,Sigma)Step+NoiseGenerator(Sigma),Step0,Sigma0});

% Output buffer
MCS.addFunctionBuffer('PreviousOutputs','Output',zeros(n2-1,1));

% Integrator output
MCS.addFunction('Output',@(PreviousOutputs,Step)PreviousOutputs(1)+Step);

% Filtered integrator output (meaning average, mask length: n1)
MCS.addFunction('FilteredOutput1',@(Output,PreviousOutputs)(Output+sum(PreviousOutputs(1:n1-1)))/n1);

% Filtered integrator output (meaning average, mask length: n2)
MCS.addFunction('FilteredOutput2',@(Output,PreviousOutputs)(Output+sum(PreviousOutputs(1:n2-1)))/n2);

% Monte-Carlo simulation
MCS.simulate(N);

% Outputs
Output          = getRealizations(MCS,'Output');
FilteredOutput1 = getRealizations(MCS,'FilteredOutput1');
FilteredOutput2 = getRealizations(MCS,'FilteredOutput2');

% Figure
Figure = figure('Color','w');

% Full screen
drawnow;
warning('off','all');
jFrame = get(Figure,'JavaFrame');
jFrame.setMaximized(true);
warning('on','all');
pause(0.1);

% Plot
I1 = plot(nan,'b');  hold('on');
I2 = plot(nan,'g');
I3 = plot(nan,'r');

% Title
title('Integrator',...
      'Fontname','Times','FontAngle','Italic',...
      'Fontsize',15,'Fontweight','light');
xlabel('Sample number');
ylabel('Integral');
legend({sprintf('Integrator raw output (normal distribution noise, \\sigma : %.1f)',Sigma0),...
        sprintf('Integrator filtered output (meaning average, mask length : %u)',n1),...
        sprintf('Integrator filtered output (meaning average, mask length : %u)',n2)},...
        'Location','NorthWest');

% Update
for n = 1:N
    set(I1,'Ydata',Output(1:n));    
    set(I2,'Ydata',FilteredOutput1(1:n));
    set(I3,'Ydata',FilteredOutput2(1:n));
    drawnow();
end
