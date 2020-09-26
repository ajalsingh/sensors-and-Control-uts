%% Q1 Linear discrete Time System
close all
clear all
clc

%% Q1.1 define parameters
d1 = 0.1;
d2 = 0.1;
a1 = 0.6;
a2 = 0.6;
b3 = 0.05;
r3 = 0.8;
x1_0 = 300;
x2_0 = 100;
x3_0 = 80;

Uk = 120;

%% 1.2 : Plot x1, x2, x3 and y against k and interpret the system stability.

% By looking at the plot, we can say the system is stable.

% from supply chain in lec notes
A = [   1-a1-d1 0   0;
        a1 1-a2-d2 b3;
        0 a2 1-b3-r3;
    ];

B = [1;
    0;
    0;
    ];

C = [0 0 r3];

X = zeros(3,13);

X(1,1) = x1_0;
X(2,1) = x2_0;
X(3,1) = x3_0;

Y = zeros(1,13);

for k = 1:12
    X(:,k+1) = A*X(:,k) + B*Uk;    
    y(k) = C*X(:,k);
end

figure
hold on
scatter(linspace(1,12,13),X(1,:))
scatter(linspace(1,12,13),X(2,:))
scatter(linspace(0,12,13),X(3,:))
scatter(linspace(1,12,12),y)
legend('X1', 'X2', 'X3', 'Y')
xlabel('k')
ylabel('Stock Units')

%% 1.3 egeinvalues of matrix A to prove claim above
eig(A)

% all values <= 1, therefore stable

%% 1.4 controllability
Co = [B A*B A^2*B];

% Check rank
rank(C)

%% 1.5 Create discrete time system model

sys = ss(A,B,C,0, 1, 'TimeUnit', 'months');

%% 1.6 use functions 'isstable' and 'ctrb'
% Check stability, 1 = stable, 0 = unstable
isstable(sys)

% Calculate control matrix
C = ctrb(A,B)

% Test number of uncontrollable states
unco = length(A) - rank(C)