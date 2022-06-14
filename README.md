# Camera Calibration using MATLAB
### Respective Tutorials
A quickstart guide for the camera calibration-workflow can be found under this link:\
https://www.youtube.com/watch?v=x6YIwoQBBxA

- For Monocular Cameras further use:\
https://de.mathworks.com/help/vision/ug/using-the-single-camera-calibrator-app.html

- For Stereo Cameras further use:\
https://de.mathworks.com/help/vision/ug/using-the-stereo-camera-calibrator-app.html

### Quick Setup
Take 10-20 pictures of the calibration pattern of your choice with your camera. Make sure that at least 20%
of the image space is covered by the calibration pattern, before storing the images in the respective folder.
Next, use the MATLAB Camera Calibrator App from the Image Processing and Computer Vision Module to compute the 
camera intrinsics. As an alternative, a pre-generated, camera specific calibration script can be directly run 
in MATLAB to obtain the camera intrinsics. Note, that you have to set the base path to your directory in the 
respective script, according to your system!

### Example calibration of a monocular camera
As an example, the visualizations of the Logitech-C270-HD-Webcam [calibration script](calibrationParameters.m) 
are shown below. Given the camera specific calibration images of the checkerboard pattern, your extrinsics 
should look something like this:

![plot](./docs/extrinsics.png)

... and your mean reprojection error like this:

![plot](./docs/mre.png)

Also note, that the numeric values of the camera intrinsics are printed to the MATLAB command window and stored
in the Workspace, from where they can be directly used or exported to another project. 