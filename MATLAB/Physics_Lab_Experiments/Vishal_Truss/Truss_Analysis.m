% TODO : No drawings as of now, but your rods, reaction and forces are registered!
% TODO : Also there have been no checks if your connections are valid or not
% TODO : By Valid I mean, you have connected one pin to a non-exist pin
% TODO : To add GUI slider for force on each joint
% TODO : To add LU decomposition

load m_joints_cord.mat
load m_rods_realtion.mat
load m_forces_location.mat
load m_reactions.mat


m_coefficients = coefficient_matrix_constructor(m_joints_cord, m_rods_relation, m_reactions);
disp(m_coefficients)

m_forces = force_matrix_constructor(m_joints_cord, m_forces_location);
disp(m_forces)

disp('Solving for the variables')
m_solution = m_coefficients \ m_forces;
disp(m_solution)

visualize_truss(m_joints_cord)
