% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 693.146788777092297 ; 690.658797250493080 ];

%-- Principal point:
cc = [ 285.679657718182568 ; 244.439451019132662 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.104696347904218 ; -0.245018965739072 ; -0.000018554764296 ; 0.000418900038295 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 1.955890350721287 ; 1.926158673666042 ];

%-- Principal point uncertainty:
cc_error = [ 3.379024115319889 ; 2.548712135933886 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.014312677715666 ; 0.075433699178538 ; 0.001532225998977 ; 0.002150132931892 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 10;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.077094e+00 ; 2.167435e+00 ; -1.528574e-01 ];
Tc_1  = [ -7.152871e+01 ; -8.811225e+01 ; 3.905708e+02 ];
omc_error_1 = [ 3.121640e-03 ; 3.593572e-03 ; 7.153774e-03 ];
Tc_error_1  = [ 1.920813e+00 ; 1.437519e+00 ; 1.246583e+00 ];

%-- Image #2:
omc_2 = [ 2.175361e+00 ; 2.247391e+00 ; 1.755259e-01 ];
Tc_2  = [ -8.893184e+01 ; -5.595433e+01 ; 4.373687e+02 ];
omc_error_2 = [ 4.077949e-03 ; 3.560676e-03 ; 8.441370e-03 ];
Tc_error_2  = [ 2.147472e+00 ; 1.630737e+00 ; 1.472607e+00 ];

%-- Image #3:
omc_3 = [ -1.954824e+00 ; -2.134566e+00 ; 4.085124e-01 ];
Tc_3  = [ -6.402983e+01 ; -8.810197e+01 ; 4.338467e+02 ];
omc_error_3 = [ 3.556916e-03 ; 3.392006e-03 ; 6.562368e-03 ];
Tc_error_3  = [ 2.123037e+00 ; 1.591949e+00 ; 1.282127e+00 ];

%-- Image #4:
omc_4 = [ 1.854765e+00 ; 1.801718e+00 ; -6.182440e-01 ];
Tc_4  = [ -9.280917e+01 ; -4.413938e+01 ; 4.758628e+02 ];
omc_error_4 = [ 2.658397e-03 ; 3.848946e-03 ; 5.979495e-03 ];
Tc_error_4  = [ 2.318214e+00 ; 1.754810e+00 ; 1.369681e+00 ];

%-- Image #5:
omc_5 = [ 1.981027e+00 ; 1.701464e+00 ; 2.168257e-01 ];
Tc_5  = [ -5.528752e+01 ; -8.101621e+01 ; 4.260997e+02 ];
omc_error_5 = [ 3.665387e-03 ; 3.381645e-03 ; 6.075139e-03 ];
Tc_error_5  = [ 2.095271e+00 ; 1.564806e+00 ; 1.400804e+00 ];

%-- Image #6:
omc_6 = [ -1.842133e+00 ; -1.905755e+00 ; -4.672404e-01 ];
Tc_6  = [ -7.019864e+01 ; -8.573046e+01 ; 3.660946e+02 ];
omc_error_6 = [ 2.419517e-03 ; 3.893550e-03 ; 6.156567e-03 ];
Tc_error_6  = [ 1.811785e+00 ; 1.358935e+00 ; 1.273970e+00 ];

%-- Image #7:
omc_7 = [ 1.630992e+00 ; 1.511887e+00 ; -1.307365e-02 ];
Tc_7  = [ -1.077307e+02 ; -6.643407e+01 ; 4.691614e+02 ];
omc_error_7 = [ 3.162091e-03 ; 3.894538e-03 ; 5.004760e-03 ];
Tc_error_7  = [ 2.301408e+00 ; 1.740504e+00 ; 1.561069e+00 ];

%-- Image #8:
omc_8 = [ 1.778478e+00 ; 2.188554e+00 ; -1.194714e+00 ];
Tc_8  = [ -7.412476e+01 ; -8.996040e+01 ; 5.188047e+02 ];
omc_error_8 = [ 2.151149e-03 ; 4.607823e-03 ; 6.820809e-03 ];
Tc_error_8  = [ 2.551430e+00 ; 1.925072e+00 ; 1.352412e+00 ];

%-- Image #9:
omc_9 = [ -1.338235e+00 ; -1.817656e+00 ; 6.342726e-01 ];
Tc_9  = [ 1.171094e+01 ; -1.299080e+02 ; 4.972659e+02 ];
omc_error_9 = [ 3.476658e-03 ; 3.802725e-03 ; 4.846238e-03 ];
Tc_error_9  = [ 2.453739e+00 ; 1.830718e+00 ; 1.354682e+00 ];

%-- Image #10:
omc_10 = [ 1.849318e+00 ; 1.368414e+00 ; 6.711313e-01 ];
Tc_10  = [ -8.632581e+01 ; -5.858224e+01 ; 4.795418e+02 ];
omc_error_10 = [ 4.031480e-03 ; 3.317189e-03 ; 5.303539e-03 ];
Tc_error_10  = [ 2.366397e+00 ; 1.776554e+00 ; 1.705986e+00 ];

