%% Q2 LQR control
clear all
close all
clc

%% Define model

A = [1.5 1.75 1.3;
    1 0 0;
    0 1 0];
B = [1;
    0;
    0];
C = [0 0 0.75];
X0 = [1;
    1;
    1];

% k = 1 -20
X = zeros(3,20);
X(1,1) = 1;
X(2,1) = 1;
X(3,1) = 1;

Y = zeros(1,20);

% 2.2 Adjust Q and R
Q = 1*eye(3);   % penalise performace
R = 1;          % penalise effort

% create open loop system
sys = ss(A,B,C,[], 1);
%% Check is sys currently stable ans=no
isstable(sys)
step(sys)
%% LQR - closed loop system

% feedback
K = lqr(sys, Q, R);

for k = 1:20
    X(:,k+1) = A*X(:,k) + B*(-1)*K*X(:,k)+50;    

    y(k) = C*X(:,k);
end

sys_cl = ss(A-B*K,B,C,[], 1);
step(sys_cl)

figure
hold on
plot(X(1,:))
plot(X(2,:))
plot(X(3,:))
plot(y)
legend('X1', 'X2', 'X3', 'Y')
xlabel('k')

eig(A-B*K)
isstable(sys_cl)