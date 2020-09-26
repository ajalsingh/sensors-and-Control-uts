%% Q4 state space model of inverted pendulum
close all;
clear;
clc;
set(0,'DefaultFigureWindowStyle','docked')

%% 4.1 parameters for the model
m=0.1;
M=2;
l=0.5;
g=9.81;

%% 4.2 check stability

% From lec notes
A=[0 1 0 0; (M+m)*g/(M*l) 0 0 0; 0 0 0 1; -m*g/M 0 0 0];
B=[0; -1/(M*l); 0; 1/M];
C=[1 0 0 0; 0 0 1 0];
D=0;

% define the state space model
inv_pend =ss(A,B,C,D);

% check eigenvalues, > 0 = stable 
eigenvals = eig(A)

%% 4.3 check controllability
Cont_M=[B A*B (A^2)*B (A^3)*B]; % You can use ctrb
rank(Cont_M)

% or...
C = ctrb(A,B);
rank(C)

%% 4.4 pole placement
% poles
P = [-1 -2 -3 -4];

% palce poles
K = place(A,B,P);

% new system
sys_cl=ss(A-B*K,B,C,D);
step(sys_cl)

%% 4.5 Design LQR control
Q = eye(4);
R = 1;

% LQR
[K_opt P_opt E_opt] = lqr(A,B,Q,R)

sys_cl_opt=ss(A-B*K_opt,B,C,D);
step(sys_cl_opt)

%% 4.6 Compute and plot the state and control inputs for the arbitrarily placed poles and the optimal control solution.
t = 0:0.1:50;
u = 0*ones(size(t));

x0 = [0;0;5;0];

[Y,T,X]=lsim(sys_cl,u,t,x0);
[Y,T,X_opt]=lsim(sys_cl_opt,u,t,x0);

figure(1)
plot(t,X,'k--',t,X_opt,'r-')

xlabel('time')
ylabel('state')

figure(2)
plot(t,-K(1)*X(:,1)-K(2)*X(:,2),'k--',t,-K_opt(1)*X_opt(:,1)-K_opt(2)*X_opt(:,2),'r-')

xlabel('time')
ylabel('control')