clear;
close all;

disp('Preprocessing image please wait . . .');

imfile='image01.jpg';
im=imread(imfile);
[im_path, im_name, im_ext]=fileparts(imfile);
gim=rgb2gray(im);

% Adaptive Threshoding
thresh=10;
adaptive_bim=bradley(gim, [15 15], thresh);

% Out Adaptive Threshoding
figure(1),imshow(adaptive_bim),title('Adaptive Thresholding BW image');
dst_folder = './image_adaptivethreshoding/';
im_outname = [dst_folder,im_name,'_adaptivethreshoding',im_ext];
imwrite (adaptive_bim,im_outname);

% Anisotropic Opening
num_iter = 5;
delta_t = 1/15;
kappa = 1;
option = 1;
aniso_gim = anisodiff(adaptive_bim,num_iter,delta_t,kappa,option);
aniso_bim = im2bw(aniso_gim);

% Out Anisotropic
figure(2), imshow(aniso_bim), title('Anisotropic opening image');
dst_folder = './image_anisotropic/';
im_outname = [dst_folder,im_name,'_anisotropic',im_ext];
imwrite (aniso_bim,im_outname);
