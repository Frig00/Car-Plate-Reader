%% Car Plate Reader
%
% This MATLAB script allows the user to read numbers and letters in car plates 
% from images. What is read by the script is returned as a string variable.
%
% Input: car image file name
%
% Output: string variable composed by letters and numbers read from the
%         image

clc;
clear all;
close all;

% Read RGB image
input_img = input('Insert your image file name: ', 's');
rgb_img = imread(input_img);

% Convert RGB image to greyscale image and then binary image
grey_img = rgb2gray(rgb_img);

% It may be necessary to change threshold value (0.7) according to the input 
% image
binary_img = imbinarize(grey_img, 0.7);

% Detecting rectangle corresponding to car plate position in the image
edges = edge(binary_img, 'Canny');
rects = regionprops(edges, 'BoundingBox');

% Serching for the rectangle with the biggest area
max_area = 0;
max_rect = [];

for rect = rects'
    bbox = rect.BoundingBox;
    area = bbox(3) * bbox(4);
    
    if area > max_area
        max_area = area;
        max_rect = bbox;
    end
end

% Reading letters and numbers in the car plate
rgb_img_crop = imcrop(rgb_img, max_rect);

% It may be necessary to change string composition according to what the
% user want to read in the car plate
string = '0123456789QWERTYUIOPLKJHGFDSAZXCVBNM-';
text = ocr(rgb_img_crop, LayoutAnalysis='word', CharacterSet=string);
fprintf("The car plate is: %s",  text.Text)
