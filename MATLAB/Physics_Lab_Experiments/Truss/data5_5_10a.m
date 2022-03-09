function [J B F R] = data5_5_10a()
%TRUSS DATA: Data for a simple truss
%  4 arrays  define a truss and loading

% Joint positions, one row for each joint
%  #  xcoord  ycoord
h= 1;  % Height of middle bar
J=[ 1 -1 0
    2  1 0
    3  0 h];

% Bar connectivity, one row for each bar
%   (bar #)  (joint # at one end)   (joint # at other end)
B=[ 1 1 3
    2 2 3];

% Reactions, one row for each reaction direction
% (xcoord, ycoord) is  a unit vector in dir. or force
% (React #) (joint applied)  (xcoord)  (ycoord)
%  
R=[ 1 1 1 0
    2 1 0 1
    3 2 1 0
    4 2 0 1];

% Applied Forces, one row for each force
% (joint) (x comp of force)  (y comp of force)
F=[3 0 -10];

end

