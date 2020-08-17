clear;
close all;
clc;

bag = rosbag('tutorial4.bag');
%%
laserScan = select(bag, 'Topic', '/scan');
firstScanMessage = readMessages(laserScan, 1);
cartesian = readC
