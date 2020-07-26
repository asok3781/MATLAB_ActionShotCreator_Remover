% make a set of small tifs

Z= zeros(3,4,3,'uint8')
Z(:,:,1)=128
Z(:,:,2)=128
Z(1,1,:)= 0 % set one pixel to black
imwrite(Z,'small01.tif')
Z(:,:,1)=128
Z(:,:,2)=128
Z(1,2,:)= 0 % set one pixel to black
imwrite(Z,'small02.tif')
Z(:,:,1)=128
Z(:,:,2)=128
Z(1,3,:)= 0 % set one pixel to black
imwrite(Z,'small03.tif')

% make a set of small pngs
Z= uint8(255*rand(4,4,3))
Z1 = Z
Z1(1,1,:)= 255 % set one pixel to white
imwrite(Z1,'rand01.png')

Z2 = Z
Z2(2,2,:)= 255 % set one pixel to white
imwrite(Z2,'rand02.png')

Z3 = Z
Z3(3,3,:)= 255 % set one pixel to white
imwrite(Z3,'rand03.png')

Z4 = Z
Z4(4,4,:)= 255 % set one pixel to white
imwrite(Z4,'rand04.png')

% make a set of small jpgs
Z= uint8(128*ones(4,4,3))
Z1 = Z
Z1(1:2,1:2,:)= 200 % set square to light grey
imwrite(Z1,'notpng01.jpg')

Z2 = Z
Z2(3:4,3:4,:)= 200 % set square to light grey
imwrite(Z2,'notpng02.jpg')

Z3 = Z
Z3(1:2,3:4,:)= 200 % set square to light grey
imwrite(Z3,'notpng03.jpg')

Z3 = Z
Z3(3:4,1:2,:)= 200 % set square to light grey
imwrite(Z4,'notpng04.jpg')

