%% Q2
close all;
clear;
clc;
set(0,'DefaultFigureWindowStyle','docked')

%% 2.1 detect surf
i1 = imread('roofs1.jpg');
i2 = imread('roofs2.jpg');
i1gs = rgb2gray(i1);
i2gs = rgb2gray(i2);

% gets corners
points1 = detectSURFFeatures(i1gs);
points2 = detectSURFFeatures(i2gs);

% gets descriptor
[features1, validPoints1] = extractFeatures(i1gs,points1);
[features2, validPoints2] = extractFeatures(i2gs,points2);

%% 2.2 Match features

% Determines the locations of corresponding points on both images
indexPairs = matchFeatures(features1, features2);

matchedPoints1 = validPoints1(indexPairs(:,1));
matchedPoints2 = validPoints2(indexPairs(:,2));

%% 2.3 Visualise matching features
showMatchedFeatures(i1gs, i2gs, matchedPoints1, matchedPoints2, 'montage');

%% 2.4 Using ORB instead of SURF
%Orb is slightly more accurate

points1 = detectORBFeatures(i1gs);
points2 = detectORBFeatures(i2gs);
[features1, validPoints1] = extractFeatures(i1gs,points1);
[features2, validPoints2] = extractFeatures(i2gs,points2);

indexPairs = matchFeatures(features1, features2);

matchedPoints1 = validPoints1(indexPairs(:,1));
matchedPoints2 = validPoints2(indexPairs(:,2));

showMatchedFeatures(i1gs, i2gs, matchedPoints1, matchedPoints2, 'montage');
