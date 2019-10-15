close all;
clear all;

imname='image01.jpg';
im=imread(imname);
gim=rgb2gray(im);
thresh=10;
% % imout=im2bw(gim, thresh);
bw_imout=bradley(gim, [15 15], thresh);
figure(1),imshow(bw_imout),title('Bradley Thresholding BW image');
imwrite (bw_imout,['./output_anisotropic/' imname 'Adapt Thresholding BW image.jpg']);
% % open_bw_imout= bwareaopen(bw_imout, 100);
% % imshow(open_bw_imout);
% figure(gcf+1),imshow([mat2gray(image), bw, bw2]);

num_iter = 5;
delta_t = 1/15;
kappa = 1;
option = 1;    
%disp('Preprocessing image please wait . . .');
aniso_imout = anisodiff(bw_imout,num_iter,delta_t,kappa,option);
aniso_bw_imout = im2bw(aniso_imout);
figure(2), imshow(aniso_bw_imout), title('Anisotropic opening image');
imwrite (aniso_bw_imout,['./output_anisotropic/' imname 'Anisotropic opening image.jpg']);