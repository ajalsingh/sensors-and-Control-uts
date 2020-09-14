clear;
%% Q1
close all;
clc;

bag = rosbag('tutorial4.bag');

laserScan = select(bag, 'Topic', '/scan');
firstScanMessage = readMessages(laserScan, 1);
cartesian = firstScanMessage{1}.readCartesian;
plot(cartesian(:,1),cartesian(:,2))

%% Q2

