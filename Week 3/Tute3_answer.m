%% Question 1
clear all
close all
clc

%% 1.1 : Load the rosbag to MATLAB workspace using the following command.
bag = rosbag('/home/ajal/git/sensors-and-Control-uts/Week 3/tutorial_RGBD.bag');

%% 1.2 : Filter out the depth images and RGB images using the select and readMessage functions.
depthImages = select(bag,'Topic', '/camera/depth/image_raw');
firstDepthImage = readMessages(depthImages, 1);

RGBImages = select(bag,'Topic', '/camera/rgb/image_raw');
firstRGBImage = readMessages(RGBImages, 1);

%% 1.3 : Observe how the image data are stored. Using what you learned in Tutorial 1, create a MATLAB RGB image from the first RGB image message published to the raw RGB image topic.
rgb_img=readImage(firstRGBImage{1});
d_img=readImage(firstDepthImage{1});

figure
imshow(rgb_img)
figure

% In depth images, pixels represent depth values (in mm) Not colours
% We convert depth to colours
imshow(uint8(double(d_img)/6000*256))