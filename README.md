# matlab-scanline
A simple fuction to show a scan line for an image interactively

%imshow_sl - function to display a scan line corrosponding to a clicked pixel
%
% Syntax:  hs = imshow_sl(image)
%
% Inputs:
%    image - Array of size (X,Y,3)
%
% Outputs:
%    hs - a structure containing handlers to the following objects
%       fig - handle for the main figure
%       ax_img - handle for the axis containing the image
%       ax_col - handle for the axis containing the column scanline 
%       ax_row - handle for the axis containing the row scanline 
%       img - handle for the Image object containing the image
%
% Example: 
%    I = imread('lenna.png');
%    h = imshow_sl(I);

% Author: Waseem Naom
% email: waseem.naom@gmail.com
% July 2016; Last revision: 15-July-2016
