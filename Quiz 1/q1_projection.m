clc;
clear;

%Get the following parameters from your calibration
px= 510.59174;%Principal point X
py=426.30246 ; %Principal point Y

fx=876.52512; %Focal length
fy=875.56956; 


%Homogenous transformation matrix
K = [fx,0,px;
     0,fy,py;
     0,0,1];
 
X_cam = [18;-32;60;1]; %3D location
IM = eye(3,4);

x = K*IM*X_cam;

u = x(1)/x(3)
v = x(2)/x(3)


