%% Question 1 Harris Corners detection looks for derivative values 
close all;
clear;
clc;
set(0,'DefaultFigureWindowStyle','docked')

% ________
% |100 |5|
% ========
% |  5 |5|
% ========
% In the grid above, the 100 values represents a corner

% 1.1 Load checkerboard image and detect corners

i = imread('checkerboard.jpg');
i = rgb2gray(i);
cornerPoints = detectHarrisFeatures(i);
imshow(i);
hold on;
plot(cornerPoints);

%% 1.2

%We expect to see 7 corners

%% 1.3 we actually see 355
clf;
set(0,'DefaultFigureWindowStyle','docked')
i = imread('harris_corners_example.jpg');
i = rgb2gray(i);
cornerPoints = detectHarrisFeatures(i)
imshow(i);
hold on;
plot(cornerPoints);

%% 1.4
clf;
set(0,'DefaultFigureWindowStyle','docked')
i = imread('harris_corners_example.jpg');
i = rgb2gray(i);
cornerPoints = detectHarrisFeatures(i, 'MinQuality', 0.2)
imshow(i);
hold on;
plot(cornerPoints);