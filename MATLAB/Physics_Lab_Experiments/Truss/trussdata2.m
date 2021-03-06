function [J B F R] = trussdata2()
%TRUSS DATA: Data for a simple truss
%  4 arrays  define a truss and loading

% Joint positions, one row for each joint
%  #  xcoord  ycoord
J=[ 1  0 0
    2  5 0
    3  5 5
    4  0 5];
% Bar connectivity, one row for each bar
%   (bar #)  (joint # at one end)   (joint # at other end)
B=[ 1 1 2
    2 2 3
    3 3 4
    4 4 1
    5 2 4];
% Reactions, one row for each reaction direction
% (xcoord, ycoord) is  a unit vector in dir. or force
% (React #) (joint applied)  (xcoord)  (ycoord)
%  
R=[ 1 4 1 0
    2 4 0 1
    3 1 1 0];
% Applied Forces, one row for each force
% (joint) (x comp of force)  (y comp of force)
F=[2 0 -500];

end

