clc
clear

I = imread('image.jpg');

movingPoints = [899 1106;2177 968; 1781 347];
fixedPoints = [899 1106;1589 236;800 170];
tform_cpp = fitgeotrans(movingPoints,fixedPoints,'affine');
I1 = imwarp(I,tform_cpp);

movingPoints = [1526 1617;1434 686; 2342 1573];
fixedPoints = [1526 1617;1526 686;2342 1617];
tform_cpp = fitgeotrans(movingPoints,fixedPoints,'affine');
I2 = imwarp(I1,tform_cpp);

movingPoints = [2433 1691;2397 868; 1611 760];
fixedPoints = [2433 1691;2433 760;1617 760];
tform_cpp = fitgeotrans(movingPoints,fixedPoints,'affine');
I3 = imwarp(I2,tform_cpp);

movingPoints = [2590 2109;1737 2229; 1776 1172];
fixedPoints = [2590 2109;1737 2109; 1776 1172];
tform_cpp = fitgeotrans(movingPoints,fixedPoints,'affine');
I4 = imwarp(I3,tform_cpp);

movingPoints = [2584 2207;1740 2207; 1778 1263];
fixedPoints = [2584 2207;1740 2207; 1778 1593];
tform_cpp = fitgeotrans(movingPoints,fixedPoints,'affine');
I5 = imwarp(I4,tform_cpp);


movingPoints = [2143 1438;2595 890; 1783 826];
fixedPoints = [2143 1438;2595 845; 1783 845];
tform_cpp = fitgeotrans(movingPoints,fixedPoints,'affine');
I6 = imwarp(I5,tform_cpp);

movingPoints = [2555 1282;1731 1626; 1767 1002];
fixedPoints = [2555 1282;1731 1541; 1767 1002];
tform_cpp = fitgeotrans(movingPoints,fixedPoints,'affine');
I7 = imwarp(I6,tform_cpp);

movingPoints = [2592 992;1737 1224; 2588 1471];
fixedPoints = [2792 940;1737 1224; 2788 1493];
tform_cpp = fitgeotrans(movingPoints,fixedPoints,'affine');
I8 = imwarp(I7,tform_cpp);

movingPoints = [2196 1138;2146 1435; 2151 1763];
fixedPoints = [2196 1194;2146 1435; 2151 1703];
tform_cpp = fitgeotrans(movingPoints,fixedPoints,'affine');
I9 = imwarp(I8,tform_cpp);



%boresh
imgdata = imcrop(I9,[2180 1058 979 447]);

%taghir meghias
T = [ 1.5 0  0;
      0  3  0;
      0  0  1];
t_nonsim = affine2d(T);
out = imwarp(imgdata,t_nonsim);

%zakhire khoroji
imwrite(out,'out.jpg');

figure
subplot(3,3,1),imshow(I),title('unknownAffine_0')
subplot(3,3,2),imshow(I1),title('unknownAffine_1')
subplot(3,3,3),imshow(I2),title('unknownAffine_2')
subplot(3,3,4),imshow(I3),title('unknownAffine_3')
subplot(3,3,5),imshow(I4),title('unknownAffine_4')
subplot(3,3,6),imshow(I5),title('unknownAffine_5')
subplot(3,3,7),imshow(I6),title('unknownAffine_6')
subplot(3,3,8),imshow(I7),title('unknownAffine_7')
subplot(3,3,9),imshow(I9),title('unknownAffine_9')

