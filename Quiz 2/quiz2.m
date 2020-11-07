%% Q1 intrinsic param
clear
clc
close all

% given params
principle_point = [682 498];
focal_length = 900;
T = 0.25;
left_im = [1056 498];
right_im = [808 498];

% dist to principle point
% pos = [x y]
left_pos = [(left_im(1) - principle_point(1)) (left_im(2) - principle_point(2))];
right_pos = [(right_im(1) - principle_point(1)) (right_im(2) - principle_point(2))];

% calc baseline of cameras
Base = T*1000;

% calculate cartesian values
z = (Base*focal_length)/(left_pos(1) - right_pos(1));
x = (z*left_pos(1))/focal_length;
y = (Base*left_pos(2))/(left_pos(1) - right_pos(1));

% final answer
final_pos = [x y z]

%% Q2 linear discrete-time sys 
%% stability

clear;
clc

A = [-1 2; 0 -3];
B = [0;1];
C = [0 0];
eig(A)


% Calculate control matrix
Co = ctrb(A,B);

%% controllability
% Test number of uncontrollable states
unco = length(A) - rank(Co);
if unco==0
    disp('contrabllable');
else
    disp('not controllable');
end
