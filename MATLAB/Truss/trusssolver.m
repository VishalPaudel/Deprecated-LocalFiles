% Truss Solver
% -Andy Ruina (modified Nov. 26, 2021)
fprintf('\n**********************************************\n')
disp(['Calculation started at:'  datestr(now)])

clear all % don't let old stuff pollute your new calculation

%READ IN DATA from a users truss data file
%datafile = 'trussdata1'
datafile = 'trussdata2'
%datafile = 'data5_5_10a';  %Enter data file as a textstring
%datafile = 'data5_5_10d';  %Enter data file as a textstring


[J B F R] = eval(datafile); %DEFS of J,B,F,R:
% J is matrix of joint positions, one row for each joint
%   The 3 columns of J are:
%      joint#  xcoord  ycoord
% B = Bar connectivity, one row for each bar
%   The 3 elements of each row are:
%       (bar #)  (joint # at one end)   (joint # at other end)
% F =  Applied Forces directions, one row for each force
%      The three elements of each row are:
%       (joint#) (x comp of force)  (y comp of force)
% R = Reaction locations  and directions, one row for each reaction component
%    The four elements of each row are     
%       (React #) (joint applied)  (xcoord)  (ycoord)
%          (xcoord, ycoord) is  a unit vector in direction of force


njoints = length(J(:,1)); %number of joints    = number of rows of J
nbars   = length(B(:,1)); %number of bars      = number of rows of B
nloads  = length(F(:,1)); %number of loads     = number of rows of F
nreacts = length(R(:,1)); %number of reactions = number of rows of R
if (nbars+nreacts) ~= 2*njoints  % ERROR CHECK: (n_eqs = n_unknowns?)
    disp('Number of equations not equal number of unkowns!')
    return %Stops the function from running
end 

%For each bar find the x and y coordinates of its base
%and tip. Each of these column arrays has the same number of elements
%as B has rows.  That's one element for each bar.
basex = J(B(:,2),2);    basey = J(B(:,2),3);
tipx  = J(B(:,3),2);    tipy  = J(B(:,3),3);


% Find the direction cosines of all of the bars
x  =  tipx - basex;      y  =  tipy - basey; % each is a column vector
D  =  sqrt(x.^2 + y.^2);
cx =  x./D;              cy = y./D; % Direction cosines

%Make arrays of zeros (for 'memory allocation')
n_eqs = 2*njoints; % number of equations
% A is square,  L (for Loads)  is a column  
A  = zeros(n_eqs,n_eqs);   L  = zeros(n_eqs,1);

%Fill in the A matrix. This represents the coefficients
%in all of the joint equilibrium equations.
for i=1:nbars   %once through for each bar
   A(2*B(i,2)-1  , i ) =  cx(i);
   A(2*B(i,2)    , i ) =  cy(i);
   A(2*B(i,3)-1  , i ) = -cx(i);
   A(2*B(i,3)    , i ) = -cy(i);
end

for j = 1:nreacts %once through for each reaction
    A(2*R(j,2)-1, nbars+j ) = R(j,3);
    A(2*R(j,2)  , nbars+j ) = R(j,4);
end

%Fill in the column vector of loads
for k = 1:nloads % once through for each load
    L(2*F(k,1)-1) = -F(k,2);
    L(2*F(k,1)  ) = -F(k,3);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SOLVE the TRUSS: 
%    find all bar tensions and reaction forces
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T=A\L;             % THIS IS _THE_ CALCULATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First nbars elements of T are bar tensions
% Next nreacts elements are the reaction forces


%%%%%%OUTPUT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
drawtruss(J, B, F, R) %The m-file drawtruss draws the truss
%fprintf('\n**********************************************\n')
disp(['Data file name is:   '  datafile])
disp('Force units determined by applied loads.')
for i = 1:nbars  %Print bar tensions
    disp([ 'Tension in bar ' num2str(i)...
          '  is:  '          num2str(T(i))  ])
end

for i = 1:nreacts %Print reaction forces
    disp(['Reaction '        num2str(i) ...
          ' at joint '       num2str(J(R(i,2))) ...
          ' in ['            num2str(R(i,3:4)) ...
          '] direction is: ' num2str(T(i+nbars))])
end

shg  %SHow  Graph.  Brings graphics window to top

disp(['Calculation complete at:'  datestr(now)])
disp('**********************************************')

