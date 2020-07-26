im=GenerateImageList('pesky','png');
imageArray=ReadImages('pesky',im);
% tic
% colourarray=cat(4,imageArray{:});
% colourarray=double(colourarray);
% med = round(median(colourarray,4));
% diff = (colourarray-med).^2;
% dist= sum (diff,3);
% [~,pic] = max(dist,[],4,'includenan');



% [r,c,~,~] = size (colourarray);
% [row,col] = ndgrid(1:r,1:c);
% red=ones(size(row));
% green=repmat(2,size(row));
% blue=repmat(3,size(row));

% linearind=sub2ind(size(colourarray),row,col,red,pic);
% linearind(:,:,2)=sub2ind(size(colourarray),row,col,green,pic);
% linearind(:,:,3)=sub2ind(size(colourarray),row,col,blue,pic);
% image=colourarray(linearind);
% image=uint8(image);
% imshow(image)
% toc

% [r,c,~] = size(imageArray{1});
% pixelList = zeros(1,length(imageArray),3);
% image = zeros(r,c,3,'uint8');
% for j = 1:c
%     for i = 1:r
%         for x = 1:length(imageArray)
%             imagePixels = imageArray{x};
%             pixelList (1,x,1) = imagePixels(i,j,1);
%             pixelList (1,x,2) = imagePixels(i,j,2);
%             pixelList (1,x,3) = imagePixels(i,j,3);   
%         end
%         [image(i,j,1),image(i,j,2),image(i,j,3)] = MostDistantPixel(pixelList);
%     end
% endim
% imshow(image)
imgarray = cat (4 ,imageArray {:});
    %convert image array to double for calculation
    imgarray = double (imgarray);
        %perform distance calculation to find most distant pixel
        med = round (median (imgarray, 4));
        difference = (imgarray - med).^2;
        distance = sum (difference, 3);
%find which image the most distant pixel is in for each pixel        
[~, index] = max (distance , [], 4);
%create arrays for creation of linear indices of new image with most
%distant pixels
[r, c, ~, ~] = size (imgarray);
    [row, col] = ndgrid (1:r, 1:c); %arrays for rows and columns
        red = ones (size (row)); %arrays for colour
        green = repmat (2, size(row));
        blue = repmat (3, size(row));
%create 3D array of linear indices to form image
%indices for red
linearind = sub2ind (size(imgarray), row, col, red, index); 
    %indices for blue
    linearind(:,:,2) = sub2ind (size(imgarray), row, col, green, index);
        %indices for green
        linearind(:,:,3) = sub2ind (size(imgarray), row, col, blue, index);
        %code repeated because different variable is used for colour each
        %time
%extract colour values from 4D array of images with linear indices array to
%form new image
image = imgarray (linearind); 
%convert image back to uint8 for displaying image
image = uint8 (image);
imshow(image)

