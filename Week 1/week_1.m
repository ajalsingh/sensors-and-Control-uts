%% Section 1 : Read images from a file 
% 1.1 : Use imread function to read an image file and store it in the workspace. 

A = imread("image2.jpg");
% 1.2 : Display the image using imshow function. 

imshow(A);
% 1.3 : Observe how the image is stored in the Matlab workspace. What is the data structure used?
%% 
% * Matrix
%% Section 2 : Image types in Matlab
% 2.2 : Write an algorithm to convert the image you stored in 2.3 into greyscale image. Note : Do not use the Matlab Image Toolbox native functions. 

convertRGBtoGrayscale_student(A);
% 2.3 : Discuss your algorithms. Obtain a new greyscale image using rgb2gray function and compare your results. 

% Matlab inbuilt function
B = rgb2gray(A);
imshow(B);
% 2.4 : Write an algothim to convert the image you stored in 3.2 into a a binary image. Note : Do not use the Matlab Image Toolbox native functions. 

convertGStoBW_student(B,0.3);
% 2.5 : Discuss your algorithms. Obtain a new binary image using im2bw function and compare your results. 

C = im2bw(B, 0.3);
imshow(C);
% 2.6 : Write your image data into files using imwrite function
% 
%% Section 3 : Image File Formats 
% 3.1 Read ‘image1.png’ image into Matlab workspace. Note it’s file size on the disk. 
% 3.2 Write the image back to the disk in ‘JPG’ format as ‘image1.jpg’. 
% 3.3 Read the ‘image1.jpg’ image back into Matlab workspace. 
% 3.4 Use imshow function to visually compare the two images. Discuss your observations. Note the file size of ‘image1.jpg’ on the disk. 
% 3.5 Follow the same approach and convert ‘image2.jpg’ to ‘image2.png’. Observe the difference between the file sizes on the disk. Compare the two images visually and discuss your observations. 
% 3.6 Discuss the pros and cons of lossless and lossy data compression for image storage.