%% Student ID
close all
clear all
clc;
ID1 = 129; %First 3 digits of student ID
ID2 = 893; %Last 3 digits of student ID
ID3 = 3; %Last digit of student ID
ID4 = 9; %Second last digit of student ID

if ID1 < 400
    A = ID1+400;
else
    A = ID1;
end

if ID2 < 500
    B = ID2+500;
else
    B = ID2;
end

if ID3 == 0
    C = 50;
elseif ID3 >=8
    C = ID3*10 - 20;
else 
    C = ID3*10;
end

D = 100 - C - 20;

if ID4 == 0
    E = 40;
elseif ID4 >=9
    E = ID4*10 - 4;
else
    E = ID4*10;
end

F = 100 - E - 10;
%% Parameters

f = 950;
px = 640;
py = 512; 
p = [px,    py;
    px,    py;
    px,    py;
    px ,   py;];
Z = 1.5;
l = 0.15; %lambda 

%% Observed and Target Positions
Obs = [25,80; A,25; 80,B; A,B];

Target = [10,10;800,10;10,800;800,800;];

%% Oberved and Desired xy
xy = (Target-p)/f;
Obsxy = (Obs-p)/f;
%% Interaction Matrix
n = length(Target(:,1));

Lx = [];
for i=1:n;
    Lxi = FuncLx(xy(i,1),xy(i,2),Z);
    Lx = [Lx;Lxi];
end

%% Error calculations
e2 = Obsxy-xy;
e = reshape(e2',[],1);
de = -e*l;

%% Velocity Calculations
Lx2 = inv(Lx'*Lx)*Lx';
Vc = -l*Lx2*e