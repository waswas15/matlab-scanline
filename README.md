# matlab-scanline
A simple fuction to show a scan line for an image interactively

imshow_sl - function to display a scan line corrosponding to a clicked pixel
Syntax:  hs = imshow_sl(image)

 Inputs:
    image - Array of size (X,Y,3)

 Outputs:
 hs - a structure containing handlers the objects in the figure

 Example: 
    I = imread('lenna.png');
    h = imshow_sl(I);

 Author: Waseem Naom
 email: waseem.naom@gmail.com
 July 2016; Last revision: 15-July-2016
