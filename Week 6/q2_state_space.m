%% Q2 state space model of mass-spring-damper control
close all;
clear;
clc;
set(0,'DefaultFigureWindowStyle','docked')

%% 2.1 parameters for the model
m = 1000;
k = 50;
c = 20;

%% 2.2 matrices for the state space model
A = [0  1; -k/m -c/m];
B = [0; 1/m];
C = [1 0];
D = 0;

%% 2.3 define the state space model
spring_damper =ss(A,B,C,D);

%% 2.4 plot using step function
step(spring_damper);

%% 2.5 state feedback using pole placement
% original poles
P_old = eig(A)

p1 = -0.1;
p2 = -0.3;

P = [p1 p2]

% use pole placement to get K
K = place(A,B,P)
A_dash = A-B*K;

% check the poles of closed loop system
poles_new = eig(A_dash)

%% 2.6 closed-loop system
spring_damper_closed_loop=ss(A_dash,B,C,D);

step(spring_damper_closed_loop/0.033)

%% 2.7 scale system dcgain
dcgain(spring_damper_closed_loop)
