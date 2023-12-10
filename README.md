# Car Plate Reader in MATLAB
This a MATLAB script done for the project of Digital Content Retrieval Module A course (academic year 2023/2024).

## Overview
This MATLAB script is designed for reading numbers and letters from car plates in images. The script takes a file name containing a car image as input and returns the recognized characters as a string variable.

## Prerequisites
- [MATLAB](https://it.mathworks.com/products/matlab.html)
- [Image Processing Toolbox](https://it.mathworks.com/help/images/)
- [Computer Vision Toolbox](https://it.mathworks.com/help/vision/)

# Usage
1. Clone the repository
```
git clone https://github.com/Frig00/Car-Plate-Reader.git
```
2. Open MATLAB and navigate to the directory containing the script.
3. Run the script in MATLAB.

# Script Workflow
The script follows these main steps:

1. Read RGB Image
The script begins by reading the RGB image file specified as keyboard input.

2. Convert to Binary Image
The RGB image is converted to a grayscale image, and then a binary image is obtained by thresholding. The binary image enhances the contrast between car and car plate and simplifies the subsequent processing.

3. Detect Car Plate Position
Using the Canny edge detector, the script identifies edges in the binary image. It then uses region properties to find bounding boxes around potential car plates. The script selects the rectangle region with the maximum area which is the one corresponding to the car plate.

4. Read Characters from Car Plate
The region containing the car plate is cropped from the original image. Optical Character Recognition (OCR) is applied to recognize characters within the cropped region. The recognized text is displayed in the MATLAB console.