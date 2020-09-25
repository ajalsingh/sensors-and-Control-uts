%% Q3: RANSAC
close all;
clear;
clc;
set(0,'DefaultFigureWindowStyle','docked')

%% 3.1 Load images
original = rgb2gray(imread('kfc1.jpg'));
distorted = rgb2gray(imread('kfc2.jpg'));

%% 3.2 Detect features
ptsOriginal = detectSURFFeatures(original);
ptsDistorted= detectSURFFeatures(distorted);
[featuresOriginal, validPointsOriginal] = extractFeatures(original,ptsOriginal);
[featuresDistorted, validPointsDistorted] = extractFeatures(distorted,ptsDistorted);

%% 3.3 Match features
indexPairs = matchFeatures(featuresOriginal, featuresDistorted);

matchedPointsOriginal = validPointsOriginal(indexPairs(:,1));
matchedPointsDistorted = validPointsDistorted(indexPairs(:,2));

%% 3.4 Visualise matching features
figure;
showMatchedFeatures(original, distorted, matchedPointsOriginal, matchedPointsDistorted, 'montage');

%% 3.5 Estimate the transform between 2 images
[tform, inlierDistorted, inlierOriginal] = estimateGeometricTransform(matchedPointsDistorted, matchedPointsOriginal, 'similarity');
% This function estimates geometric transformation between 2 images using
% MSAC (variant of RANSAC), and removes outliers

%% 3.6 view matching feature points w/o outliers
figure;
showMatchedFeatures(original, distorted, inlierOriginal, inlierDistorted);
title('Matching Points (inliers only');
legend('ptsOriginal','ptsDistorted');

%% 3.7 Recover scale and rotation of 2nd image using inverse transformation matrix
Tinv = tform.invert.T;
ss = Tinv(2,1);
sc = Tinv(1,1);
scaleRecovered = sqrt(ss*ss + sc*sc)
thetaRecovered = atan2(ss,sc)*180/pi

%% 3.8 Recover second image
% shows kfc2.jpg as if it was taken from the same camera orientation as
% kfc1.jpg

outputView = imref2d(size(original));
recovered = imwarp(distorted,tform,'OutputView',outputView);
figure, imshowpair(original,recovered,'montage')