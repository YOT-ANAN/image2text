 fname = './image_input/image01.jpg';
 im=imread(fname);
gim=rgb2gray(im);

%I = imread('printedtext.png');
BW = imbinarize(gim,'adaptive','ForegroundPolarity','dark','Sensitivity',0.3);
figure
imshow(BW)
title('Binary Version of Image')



%figure(1), imshow(im), title('RGB image');

figure(2), imshow(gim), title('Gray image');


% Otsu's Thresholding
level_otsu = graythresh(gim)

% [IDX, level] = otsu(gim,2);

bim_otsu = im2bw(gim,level_otsu);
figure(3), imshow(bim_otsu), title('Otsu BW image');

% Matlab bw
bim_bw = im2bw(gim,0.35);
figure(4), imshow(bim_bw), title('Matlab BW image');

% Isodata Thresholding
level_iso = isodata(gim)
bim_iso = im2bw(gim,level_iso);
figure(5), imshow(bim_iso), title('Isodata BW image');

biw_array=[bim_otsu  bim_bw bim_iso];

figure
montage(biw_array),title('--------------Otsu BW image---------------------------------------------------------------Matlab BW image-----------------------------------------------------------------Isoda BW image--------------')