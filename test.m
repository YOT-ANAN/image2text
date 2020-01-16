imfile='adaptive_image/image01.jpg';
im=imread(imfile);
[im_path, im_name, im_ext]=fileparts(imfile);


num_iter = 5;
delta_t = 1/15;
kappa = 1;
option = 1;
aniso_gim = anisodiff(im,num_iter,delta_t,kappa,option);
aniso_bim = imbinarize(aniso_gim);
figure(2), imshow(aniso_bim), title('Anisotropic opening image');