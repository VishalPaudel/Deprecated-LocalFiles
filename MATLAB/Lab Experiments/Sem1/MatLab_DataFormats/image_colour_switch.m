clc;
close all;
workspace;
clear;
fontSize = 16;
% Read in a standard MATLAB color demo image.
folder = fullfile(matlabroot, '\toolbox\images\imdemos');
baseFileName = 'DESIGN_Process.png';
fullFileName = fullfile(folder, baseFileName);
% Get the full filename, with path prepended.
fullFileName = fullfile(folder, baseFileName);
if ~exist(fullFileName, 'file')
  % Didn't find it there.  Check the search path for it.
  fullFileName = baseFileName; % No path this time.
  if ~exist(fullFileName, 'file')
    % Still didn't find it.  Alert user.
    errorMessage = sprintf('Error: %s does not exist.', fullFileName);
    uiwait(warndlg(errorMessage));
    return;
  end
end
rgbImage = imread(fullFileName);
% Get the dimensions of the image.  numberOfColorBands should be = 3.
[rows columns numberOfColorBands] = size(rgbImage);
% Display the original color image.
subplot(1, 2, 1);
imshow(rgbImage, []);
title('Original Color Image', 'FontSize', fontSize);
% Enlarge figure to full screen.
set(gcf, 'Position', get(0,'Screensize')); 
cform = makecform('srgb2lab');
lab = applycform(rgbImage, cform); 
L_channel = lab(:,:,1);
A_channel = lab(:,:,2);
B_channel = lab(:,:,3);
L_channelNew = 100 - L_channel;
A_channelNew = 255-A_channel;
labNew = cat(3, L_channelNew, A_channelNew, B_channel);
cform2 = makecform('lab2srgb');
rgbNew = applycform(labNew,cform2); 
% Display the new color image.
subplot(1, 2, 2);
imshow(rgbNew, []);
title('Transformed Color Image', 'FontSize', fontSize);