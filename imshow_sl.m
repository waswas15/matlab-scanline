function hs = imshow_sl(image)
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


% Add the UI components
hs = addcomponents;

% Make figure visible after adding components
hs.fig.Visible = 'on';

    function hs = addcomponents
        % Add components, save handles in a struct
        hs.fig = figure('Visible','off',...
            'Tag','fig',...
            'Name','Scan Line');%,...
        %             'SizeChangedFcn',@resizeui);
        %        hs.btn = uicontrol(hs.fig,'String',...
        %                   'Plot Sine',...
        %                   'Callback',@plotsine,...
        %                   'Tag','button');
        hs.ax_img = subplot('Position',[0.1,0.2,0.7,0.75],'Parent',hs.fig,...
            'Tag','ax1');
        hs.ax_col = subplot('Position',[0.85,0.2,0.1,0.75],'Parent',hs.fig,...
            'Tag','ax2');
        hs.ax_row = subplot('Position',[0.1,0.05,0.7,0.1],'Parent',hs.fig,...
            'Tag','ax3');
        hs.img = imshow(image,'Parent',hs.ax_img,...
            'Border','tight');
        %             'InitialMagnification','fit');
        
        set(hs.img ,'ButtonDownFcn',@plotrc);
        title(hs.ax_img,'Image');
    end


    function plotrc(hObject,callbackdata)
        % Callback method to execute if a pixel is clicked within an image
        % find axis boundaries;
        x = hObject.XData(2);
        y = hObject.YData(2);
        % get recent mouse click
        coor = callbackdata.IntersectionPoint;
        clicked_x = floor(coor(1,1));
        clicked_y = floor(coor(1,2));
        % Check whether the pixel clicked within the boundaries of the
        % image
        if clicked_y<= y && clicked_y >= 1
            % Plot the column corrosponding to the X position of the pixel clicked
            plot(image(clicked_y,:,1),'Parent',hs.ax_row,'MarkerFaceColor','r');
            xlim(hs.ax_row,[0,x]);
            title(hs.ax_row,['X : ',int2str(clicked_x),', ','Y : ',int2str(clicked_y)]);
        end
        if clicked_x <= x && clicked_x >= 1
            % Plot the column corrosponding to the Y position of the pixel clicked
            % We need to flip the array left to right for display
            plot(fliplr(image(:,clicked_x,1)'),1:y,'Parent',hs.ax_col,'MarkerFaceColor','r');
            ylim(hs.ax_col,[0,y]);
            title(hs.ax_col,['X : ',int2str(clicked_x),', ','Y : ',int2str(clicked_y)]);
        end
    end
end