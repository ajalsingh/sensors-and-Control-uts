%% Question 1
% 1.1 Load checkerboard image and detect corners
set(0,'DefaultFigureWindowStyle','docked')
i = imread('checkerboard.jpg');
i = rgb2gray(i);
cornerPoints = detectHarrisFeatures(i);
imshow(i);
hold on;
plot(cornerPoints);

%% 1.2
