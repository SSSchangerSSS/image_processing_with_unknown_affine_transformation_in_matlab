clc
clear

I = imread('E.jpg');
%imshow(I);

%imtool(I);
movingPoints = [388 387;523 148;125 95];
fixedPoints = [455 353;455 121;135 121];
tform_cpp = fitgeotrans(movingPoints,fixedPoints,'affine');
I1 = imwarp(I,tform_cpp);
imtool(I1);

%boresh
imgdata = imcrop(I1,[131 161 329 235]);

%taghir meghias
T = [ 2 0  0;
      0  6  0;
      0  0  1];
t_nonsim = affine2d(T);
out = imwarp(imgdata,t_nonsim);

%zakhire khoroji
imwrite(out,'out2.jpg');


