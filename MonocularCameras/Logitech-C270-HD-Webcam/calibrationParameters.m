% Auto-generated by cameraCalibrator app on 14-Jun-2022
%-------------------------------------------------------


% Define images to process, based on invidual base path
basePath = 'C:\Users\morit\OneDrive\Daily\Git';
imageFileNames = {strcat(basePath, '\camera-calibration\MonocularCameras\Logitech-C270-HD-Webcam\img\WIN_20220613_19_01_28_Pro.jpg'),...
    strcat(basePath, '\camera-calibration\MonocularCameras\Logitech-C270-HD-Webcam\img\WIN_20220613_19_01_31_Pro.jpg'),...
    strcat(basePath, '\camera-calibration\MonocularCameras\Logitech-C270-HD-Webcam\img\WIN_20220613_19_01_43_Pro.jpg'),...
    strcat(basePath, '\camera-calibration\MonocularCameras\Logitech-C270-HD-Webcam\img\WIN_20220613_19_01_57_Pro.jpg'),...
    strcat(basePath, '\camera-calibration\MonocularCameras\Logitech-C270-HD-Webcam\img\WIN_20220613_19_02_29_Pro.jpg'),...
    };
% Detect calibration pattern in images
detector = vision.calibration.monocular.CheckerboardDetector();
[imagePoints, imagesUsed] = detectPatternPoints(detector, imageFileNames);
imageFileNames = imageFileNames(imagesUsed);

% Read the first image to obtain image size
originalImage = imread(imageFileNames{1});
[mrows, ncols, ~] = size(originalImage);

% Generate world coordinates for the planar pattern keypoints
squareSize = 22;  % in units of 'millimeters'
worldPoints = generateWorldPoints(detector, 'SquareSize', squareSize);

% Calibrate the camera
[cameraParams, imagesUsed, estimationErrors] = estimateCameraParameters(imagePoints, worldPoints, ...
    'EstimateSkew', false, 'EstimateTangentialDistortion', false, ...
    'NumRadialDistortionCoefficients', 2, 'WorldUnits', 'millimeters', ...
    'InitialIntrinsicMatrix', [], 'InitialRadialDistortion', [], ...
    'ImageSize', [mrows, ncols]);

% View reprojection errors
h1=figure; showReprojectionErrors(cameraParams);

% Visualize pattern locations
h2=figure; showExtrinsics(cameraParams, 'CameraCentric');

% Display parameter estimation errors
displayErrors(estimationErrors, cameraParams);

% For example, you can use the calibration data to remove effects of lens distortion.
undistortedImage = undistortImage(originalImage, cameraParams);

% See additional examples of how to use the calibration data.  At the prompt type:
% showdemo('MeasuringPlanarObjectsExample')
% showdemo('StructureFromMotionExample')
