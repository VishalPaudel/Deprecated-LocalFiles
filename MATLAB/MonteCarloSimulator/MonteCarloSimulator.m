%% Monte-Carlo simulator
%  Author  : E. Ogier
%  Version : 1.0
%  Release : 5th apr. 2016
%  
%  OBJECT METHODS :
%
%  - MCS = MonteCarloSimulator()                  % Create a Monte-Carlo simulator object
%  - MCS.addRandomVariable(NAME,aFUNCTION)        % Add a random variable whose name is NAME and corresponding anonymous function to generate realizations is aFUNCTION
%  - MCS.addFunctionBuffer(NAME,FUNCTION,VALUES)  % Add a buffer called NAME to store the values of the function titled FUNCTION and intialize it with VALUES vector or scalar
%  - MCS.addFunction(NAME,aFUNCTION)              % Add a function called NAME, which combines others data in its aFUNCTION anonymous function
%  - MCS.simulate(ITERATIONS)                     % Simulate process for ITERATIONS times
%  - DATA = MCS.getRealizations(NAME)             % Get the realizations of the variable or function called NAME
%  - [DATAF DATAV] = MCS.getRealizations()        % Get all the realization and save respectively functions and variables data in DATAF and DATAV matrices
%  
%  OBJECT PROPERTIES <default> :
%
%  - Variables <{}>  % Names of the random variables defined by user through 'addRandomVariable' method
%  - Functions <{}>  % Names of the functions defined by user through 'addFunction' method
%
%  DESCRIPTION :
%
%  "MonteCarloSimulator" is an object dedicated to the simulation of random phenomena on the basis of random variables generators and functions describing the simulated statistical process. Thus, the random variables and the numerical functions defined by user are updated for each of the simulation steps through the arithmetic expressions defined in anonymous functions. The reference to the previous values of a function is possible through the definition of buffers storing its last values.
%  Any function can refer to the variables, function buffers or previously defined functions by defining them as input arguments of its anonymous function. These input arguments must be defined in a specific order:
%  1) Other functions
%  2) Function buffers
%  3) Random variables
% 
%  Then, for each of the simulation steps, all the arguments from the list above are extracted and injected in the arithmetic expression of the anonymous function corresponding to the function to evaluate. The simulation is performed for a specified number of realizations with the display of the estimated time remaining thanks to a timer wait bar.
%  
%  The source folder includes the following examples:
%  - Buffon’s needle (short needle case)
%  - Gyroscope random walk (integration of angle increments with white noise)
%  - Filtering integrator (two meaning average masks)
%  - German tank problem (test of an estimator)
%  - Bi-dimensional random walk
%  
%  The internal timer wait bar and the video recorder sources are enable at the following addresses:
%  - http://www.mathworks.com/matlabcentral/fileexchange/55985-timer-waitbar
%  - http://www.mathworks.com/matlabcentral/fileexchange/56100-video-recorder
%  
%  EXAMPLE :
% 
%  % Constants
%  nl = 1;   % Needle length
%  wsw = 2;  % Wood strips width
%  N = 1e3;  % Number of realizations
%  
%  % Downsampling step for video
%  Video = 0;
%  dn = 10;
%  
%  % Uniform distribution generator
%  Uniform = @(Min,Max)rand(1,1)*(Max-Min)+Min;
%  
%  % Monte-Carlo simulator
%  MCS = MonteCarloSimulator();
%  
%  % Random variables
%  MCS.addRandomVariable('Angle',   {Uniform,0,pi/2});  % Needle angle
%  MCS.addRandomVariable('Distance',{Uniform,0,wsw/2}); % Needle distance
%  
%  % Intersection indicator
%  MCS.addFunction('IntersectionIndicator',@(Angle,Distance)gt(nl/2*sin(Angle),Distance));
%  
%  % Simulation
%  MCS.simulate(N);
%  
%  % Indicator realizations
%  Indicator = MCS.getRealizations('IntersectionIndicator');
%  
%  % Estimated probability
%  p = numel(find(Indicator))/N;
%  
%  % Pi value estimation
%  pi_estimated = 2 * nl / (wsw*p);
%  
%  % Display
%  fprintf('Estimation of "pi" : %g\n',pi_estimated);
%  fprintf('Relative error : %+.1f%%\n',100*(pi_estimated/pi-1));
%  
%  %% Graphical representations
%  
%  % Random variables realizations
%  Angle    = MCS.getRealizations('Angle');
%  Distance = MCS.getRealizations('Distance');
%  
%  % Figure
%  Figure = figure('Color','w');
%  
%  % Video recorder
%  if Video
%      VR = VideoRecorder('Filename','Gyro','Figure',Figure); %#ok<UNRCH>
%  end
%  
%  % Full screen
%  drawnow;
%  warning('off','all');
%  jFrame = get(Figure,'JavaFrame');
%  jFrame.setMaximized(true);
%  warning('on','all');
%  pause(0.1);
%  
%  % Number of realizations
%  N = numel(Angle);
%  
%  % Pi estimation
%  Pi_estimated = zeros(N,1);
%  for n = 1:N
%      ni = numel(find(Indicator(1:n)));
%      p = ni/n;
%      Pi_estimated(n) = 2 * nl / (wsw*p);
%  end
%  
%  % Update
%  for n = 0:dn:N
%      
%      switch n
%          
%          case 0
%              
%              % Axes #1 
%              Axes(1) = subplot(4,1,1:3);            
%              box('on');
%              hold('on');
%              title('Buffon''s needle (short needle case)',...
%                  'Fontname','Times','FontAngle','Italic',...
%                  'Fontsize',15,'Fontweight','light');
%              xlabel('Needle angle [rad]');
%              ylabel('Needle vs wood strip distance [cm]');
%  
%              % Intersection condition in term of angle and distance couple
%              Angle0 = linspace(0,pi/2,1000);
%              Distance0 = nl/2*sin(Angle0);
%              
%              % Indicator plots
%              g = plot(nan,nan,'g.'); % Intersection
%              r = plot(nan,nan,'r.'); % No intersection
%              
%              % Intersection limit
%              plot(Angle0,Distance0,'b--');
%              
%              % Plot legend
%              legend({'Intersection','No intersection','Limit'},'Fontsize',10);
%              
%              % Axes #2            
%              Axes(2) = subplot(4,1,4);                      
%              box('on');
%              hold('on');
%              
%              % Pi estimated values plot
%              Pi_estimated_plot = plot(1:dn,Pi_estimated(1:dn),'b');
%              
%              % Pi
%              Pi_line = plot(1:dn,pi*ones(1,dn),'g');               
%              
%              % Axes #2 setting
%              Legend = legend({sprintf('<\\Pi>'),sprintf('\\Pi')},...
%                  'Fontsize',10,'Location','NorthWest');          
%              xlabel('Number of iterations');
%              ylabel('Estimation of \Pi');
%              set(Axes(2),'Xscale','log');
%              hold('on');
%              grid('on');
%              box('on');
%              
%          otherwise
%                          
%              % Points update
%              I = eq(Indicator(1:n),1);
%              set(g,'Xdata',Angle(I),'Ydata',Distance(I));
%              set(r,'Xdata',Angle(~I),'Ydata',Distance(~I));
%              
%              % Number of intsersections
%              ni = numel(find(Indicator(1:n)));
%              
%              % Estimated probability
%              p = ni/n;
%              
%              % Pi value estimation
%              pi_estimated = 2*nl/(wsw*p);            
%              Pi_estimated(n) = pi_estimated;
%              
%              % Update
%              set(Pi_estimated_plot,'Xdata',1:n,'Ydata',Pi_estimated(1:n));            
%              set(Pi_line,'Xdata',1:n,'Ydata',pi*ones(n,1));            
%              set(Legend,...
%                  'String',{sprintf('<\\Pi> = %.4f',pi_estimated),...
%                            sprintf('\\Pi (\\Delta\\Pi = %+.1f%%)',100*(pi_estimated/pi-1))});
%              
%              % Refreshment
%              drawnow();
%          
%              if Video, VR.add(); end %#ok<UNRCH> 
%              
%      end
%      
%  end
%  
%  if Video, VR.stop(); end %#ok<UNRCH>

classdef MonteCarloSimulator < hgsetget
    
    % Public properties
    properties (Access = 'public')
        Variables = {};
        Functions = {};
    end
    
    % Private properties
    properties (Access = 'private')
        VariablesIndexes = {};
        BuffersIndexes   = {};
        FunctionsIndexes = {};
        RandomVariables  = {};
        FunctionBuffers  = [];
        RandomFunctions  = {};
        RealizationsData = [];
        FunctionsData    = [];        
        TimerWaitBar = ...                       % Timer waitbar
            struct('Interruption',    false, ... % Interruption status
                   'Iterations',      0,     ... % Number of iterations to perform
                   'Waitbar',         [],    ... % Waitbar object
                   'Counter',         0,     ... % Iteration counter
                   'InitialTime',     0,     ... % First iteration time
                   'InitialTimeDays', 0);        % First iteration time in whole days
    end
    
    % Public methods
    methods (Access = 'public')
        
        % Constructor
        function Object = MonteCarloSimulator(varargin)
            
            Properties = varargin(1:2:end);
            Values = varargin(2:2:end);
            
            for n = 1:length(Properties)
                
                [is, Property] = isproperty(Object,Properties{n});
                
                if is
                    Object.(Property) = Values{n};
                else
                    error('Property "%s" not supported !',Properties{n});
                end
                
            end
            
        end
        
        % Function 'set'
        function Object = set(Object,varargin)
            
            Properties = varargin(1:2:end);
            Values = varargin(2:2:end);
            
            for n = 1:length(Properties)
                
                [is, Property] = isproperty(Object,Properties{n});
                
                if is
                    Object.(Property) = Values{n};
                else
                    error('Property "%s" not supported !',Properties{n});
                end
                
            end
            
        end
        
        % Function 'get'
        function Value = get(varargin)
            
            switch nargin
                
                case 1
                    
                    Value = varargin{1};
                    
                otherwise
                    
                    Object = varargin{1};
                    [is, Property] = isproperty(Object,varargin{2});
                    if is
                        Value = Object.(Property);
                    else
                        error('Property "%s" not supported !',varargin{2});
                    end
                    
            end
            
        end
        
        % Function 'isproperty'
        function [is, Property] = isproperty(Object,Property)
            
            Properties = fieldnames(Object);
            [is, b] = ismember(lower(Property),lower(Properties));
            Property = Properties{b};
            
        end
        
        % Function 'addRandomVariable'
        function Object = addRandomVariable(Object,Name,AFunction)
            
            Name2 = matlab.lang.makeValidName(Name);
            if ~strcmp(Name2,Name)
                warning('The variable variable named "%s" was replaced by "%s" expression',Name,Name2);
            end
            Object.RandomVariables.(Name2) = AFunction;
            v = numel(Object.Variables)+1;
            Object.Variables{v} = Name2;
            
        end
        
        % Function 'addFunctionBuffer'
        function Object = addFunctionBuffer(Object,BufferName,FunctionName,BufferInitialValues)            
                        
            Object.FunctionBuffers.(BufferName).Function = FunctionName;
            Object.FunctionBuffers.(BufferName).Data     = {BufferInitialValues};
            
        end
        
        % Function 'addFunction'
        function Object = addFunction(Object,Name,AFunction)
            
            % Function name control
            Name2 = matlab.lang.makeValidName(Name);
            if ~strcmp(Name2,Name)
                warning('The function called "%s" was replaced by "%s" expression',Name,Name2);
            end
            Object.RandomFunctions.(Name) = AFunction;
            f = numel(Object.Functions)+1;
            Object.Functions{f} = Name2;
            
            % Variables and functions buffers indexes
            if ~isnumeric(AFunction)
                
                % List of variables
                String = char(AFunction);
                Elements = textscan(strtrim(String),'%s','delimiter','@()');
                if isempty(Elements{1}{3})
                    List = {};
                else
                    List = textscan(Elements{1}{3},'%s','Delimiter',',');
                    List = List{1};
                end
                
                % Variables index for the current function
                Index1 = [];
                
                % Function buffer index for the current function                 
                Index2 = [];
                
                % Function index for the current function
                Index3 = [];
                
                % Names searching
                for v = 1:numel(List)                    
                    
                    % Index of a variable
                    [b1,n1] = ismember(List(v),Object.Variables);
                                        
                    % Index of a buffer
                    if isempty(Object.FunctionBuffers)
                        b2 = 0;
                    else
                        [b2,n2] = ismember(List(v),fieldnames(Object.FunctionBuffers));  
                    end
                    
                    % Index of a function
                    if isempty(Object.Functions)
                        b3 = 0;
                    else               
                        [b3,n3] = ismember(List(v),Object.Functions);
                    end
                 
                    if b1
                        Index1(end+1) = n1; %#ok<AGROW>
                    elseif b2
                        Index2(end+1) = n2; %#ok<AGROW>
                    elseif b3
                        Index3(end+1) = n3; %#ok<AGROW>
                    else
                        error('The random variable, function buffer or function called "%s" is not defined.',List{v}) ;
                    end
                end
                
            else
                
                % No argument for current anonymous function
                Index1 = [];
                Index2 = [];
                Index3 = [];
            
            end
            
            % Variables and functions buffers indexes
            Object.VariablesIndexes{f} = Index1;
            Object.BuffersIndexes{f}   = Index2;
            Object.FunctionsIndexes{f} = Index3;
            
        end     
        
        % Function 'simulate'
        function Object = simulate(Object,varargin)
            
            % Number of iterations
            if nargin == 1, N = 1;
            else N = varargin{1};
            end
            
            % Random variables
            if isempty(Object.RandomVariables)
                RVariables = [];
                V = 0;
            else
                RVariables = fieldnames(Object.RandomVariables);
                V = numel(RVariables);
            end
            
            % Function buffers
            if ~isempty(Object.FunctionBuffers)
                FBuffers = fieldnames(Object.FunctionBuffers);
            end
            
            % Functions
            RFunctions = fieldnames(Object.RandomFunctions);
            F = numel(RFunctions);
            
            % Realizations
            Object.RealizationsData = cell(N,numel(RVariables));
            Object.FunctionsData    = zeros(N,numel(RFunctions));
            
            % Creation of a timer waitbar object
            Object.Timerwaitbar(N);
            
            for n = 1:N
                
                % Random variables realizations
                for v = 1:V
                    Generator = Object.RandomVariables.(RVariables{v});
                    switch numel(Generator)
                        case 1,    Object.RealizationsData{n,v} = Generator;
                        otherwise, Object.RealizationsData{n,v} = feval(Generator{1},Generator{2:end});
                    end
                end
                
                % Functions values
                for f = 1:F
                    
                    % Variables values
                    if isempty(Object.VariablesIndexes{f})
                        VariablesValues = [];
                    else
                        VariablesValues = Object.RealizationsData(n,(Object.VariablesIndexes{f})); 
                    end
                    
                    % Buffers values
                    if isempty(Object.BuffersIndexes{f})
                        BufferValues = [];
                    else
                        BufferValues = Object.FunctionBuffers.(FBuffers{Object.BuffersIndexes{f}}).Data;
                    end
                    
                    % Other functions values
                    if isempty(Object.FunctionsIndexes{f})
                        FunctionsValues = [];
                    else
                        FunctionsValues = Object.FunctionsData(n,Object.FunctionsIndexes{f});
                    end
                    
                    % Current anonymous function inputs (concatenation of functions, buffers and variables values)
                    if isempty(VariablesValues)
                        if isempty(BufferValues)
                            if isempty(FunctionsValues)
                                Inputs = [];
                            else
                                if isscalar(FunctionsValues)
                                    Inputs = {FunctionsValues};
                                else
                                    Inputs = FunctionsValues;
                                end
                            end
                        else
                            if isempty(FunctionsValues)
                                Inputs = BufferValues;
                            else
                                Inputs = cat(1,FunctionsValues,BufferValues);
                            end
                        end
                    else
                        if isempty(BufferValues)
                            if isempty(FunctionsValues)
                                Inputs = VariablesValues;
                            else                                
                                Inputs = cat(1,FunctionsValues,VariablesValues);
                            end
                        else
                            if isempty(FunctionsValues)
                                Inputs = cat(1,BufferValues,VariablesValues);
                            else
                                Inputs = cat(1,FunctionsValues,BufferValues,VariablesValues);
                            end
                        end
                        
                    end                   
                    
                    % Anonymous function
                    Function = Object.RandomFunctions.(RFunctions{f});
                    
                    % Anonymous function
                    if isempty(Inputs)
                        Object.FunctionsData(n,f) = Function;
                    else
                        Object.FunctionsData(n,f) = feval(Function,Inputs{:});
                    end
                                        
                    % Current buffer update
                    if ~isempty(Object.BuffersIndexes{f})
                        Data = Object.FunctionBuffers.(FBuffers{Object.BuffersIndexes{f}}).Data{1};                        
                        Data = circshift(Data,1);
                        Data(1) = Object.FunctionsData(n,f);
                        Object.FunctionBuffers.(FBuffers{Object.BuffersIndexes{f}}).Data = {Data};
                    end
                    
                end
                
                % Timer waitbar update
                Object.Timerwaitbar_update();
                
                % Loop break if manual cancelation
                if Object.Timerwaitbar_isinterrupted()
                    break
                end
                
            end
            
            % Timer waitbar deletion
            Object.Timerwaitbar_delete();
            
        end
        
        % Function 'getRealizations'
        function varargout = getRealizations(Object,varargin)
            
            switch nargout
                
                case 1
                    
                    % Function control
                    Name = varargin{1};
                    Name2 = matlab.lang.makeValidName(Name);
                    if ~strcmp(Name2,Name)
                        warning('The function called "%s" was replaced by "%s" expression',Name,Name2);
                    end
                    
                    % Variables or functions indexes
                    [bv,nv] = ismember(Name2,Object.Variables);
                    [bf,nf] = ismember(Name2,Object.Functions);                    
                    if bv
                        Realizations = cell2mat(Object.RealizationsData);
                        n = nv;
                    elseif bf
                        Realizations = Object.FunctionsData;
                        n = nf;
                    else
                        error('The variable of function called "%s" doesn''t exist.',Name2)
                    end
                    
                    % Realizations
                    varargout{1} = Realizations(:,n);
                    
                case 2
                    
                    % Realizations
                    varargout{1} = Object.FunctionsData;
                    varargout{2} = cell2mat(Object.RealizationsData);
                    
            end
            
        end
        
    end
        
    % Timer waitbar methods
    methods (Access = 'protected')
        
        % Timer waitbar onstructor
        function Object = Timerwaitbar(Object,Iterations)
            
            Object.TimerWaitBar = ...
                struct('Interruption',    false,      ... % Interruption status
                       'Iterations',      Iterations, ... % Number of iterations to perform
                       'Waitbar',         [],         ... % Waitbar object
                       'Counter',         0,          ... % Iteration counter
                       'InitialTime',     0,          ... % First iteration time
                       'InitialTimeDays', 0);             % First iteration time in whole days
        
        end
        
        % Function 'isinterrupted' (cancelation status)
        function Status = Timerwaitbar_isinterrupted(Object)
            
            Status = Object.TimerWaitBar.Interruption;            
            
        end
        
        % Function 'update' (waitbar update)
        function Object = Timerwaitbar_update(Object)
                                    
            % Time initialization
            if Object.TimerWaitBar.Counter == 0
               Date = clock;
               Object.TimerWaitBar.InitialTime = Date;               
               Object.TimerWaitBar.InitialTimeDays = floor(datenum(Date));
            end
            
            % Waitbar creation
            if isempty(Object.TimerWaitBar.Waitbar)
                Object.TimerWaitBar.Waitbar = waitbar(0,'','Name','Progression','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
                setappdata(Object.TimerWaitBar.Waitbar,'canceling',0);
            end
                        
            % Iterations counter increment
            Object.TimerWaitBar.Counter = Object.TimerWaitBar.Counter+1;
            
            % Progression
            p = Object.TimerWaitBar.Counter/Object.TimerWaitBar.Iterations;
                      
            % Elapsed time from first iteration
            dt = etime(clock,Object.TimerWaitBar.InitialTime);
            
            % Estimations
            ETR = (1/p-1)*dt/86400;   % Estimated time remaining  [day]
            ETA = datenum(clock)+ETR; % Estimated time of arrival [day]
            
            % ETR string
            if ETR < 1
                ETRstring = datestr(ETR,'HH:MM:SS');    % ETR <  1day
            else
                ETRstring = datestr(ETR,'dd HH:MM:SS'); % ETR >= 1day
                ETRstring = strrep(ETRstring,' ','d ');
            end
            
            % ETA string
            if floor(ETA) == Object.TimerWaitBar.InitialTimeDays
                ETAstring = datestr(ETA,'HH:MM:SS PM');  % ETA : today
            else
                ETAstring = datestr(ETA,'ddd HH:MM PM'); % ETA : later
            end
            
            % Progress bar update (WIP | ETR | ETA)
            waitbar(p,Object.TimerWaitBar.Waitbar,sprintf('WIP: %.1f%%  |  ETR: %s  |  ETA: %s',100*p,ETRstring,ETAstring));
            
            % Interruption status
            Object.TimerWaitBar.Interruption = getappdata(Object.TimerWaitBar.Waitbar,'canceling');
            
            % Waitbar deletion (ending or cancelation)
            if p == 1 || Object.TimerWaitBar.Interruption
                delete(Object.TimerWaitBar.Waitbar);
            end
        
        end
        
        % Function 'delete'
        function Object = Timerwaitbar_delete(Object)
            if ishandle(Object.TimerWaitBar.Waitbar)
                delete(Object.TimerWaitBar.Waitbar);
            end
            Object.TimerWaitBar = [];
        end      

    end
    
end
