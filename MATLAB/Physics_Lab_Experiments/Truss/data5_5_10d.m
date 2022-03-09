function [J B F R] = data5_5_10d()
%TRUSS DATA: Data for a simple truss
%  4 arrays  define a truss and loading

% Joint positions, one row for each joint.
% The three elements of each row are:
%  joint#  xcoord  ycoord
% If offset d=0, this truss is not rigid
d=0.001;  % Horizontal offset of joints 5 & 6.
J=[ 1 0 0
    2 0 1
    3 0 2
    4 1 0
    5 1+d 1
    6 1+d 2];

% Bar connectivity, one row for each bar
% The 3 elements of each row are:
%   (bar #)  (joint # at one end)   (joint # at other end)
B=[ 1 1 4
    2 1 5
    3 1 6
    4 2 4
    5 2 5
    6 2 6
    7 3 4
    8 3 5
    9 3 6];

% Reactions, one row for each reaction direction
% (xcoord, ycoord) is  a unit vector in direction of force
% (React #) (joint applied)  (xcoord)  (ycoord)
%  
R=[ 1 1 1 0
    2 1 0 1
    3 4 0 1];

% Applied Forces, one row for each force
% The three elements of each row are:
% (joint) (x comp of force)  (y comp of force)
F=[6 0 -10];

end

