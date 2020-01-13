% im_name='.\image_with_noise\image01_adaptivethreshoding.jpg';

im_name='.\image_adaptivethreshoding\image10_adaptivethreshoding.jpg'; 
im = imread(im_name);
EB=EBCM(im);
fprintf('EBCM = %5.2f\n', EB);


im_name='.\image_anisotropic\image10_anisotropic.jpg'; 
im = imread(im_name);
EB=EBCM(im);
fprintf('EBCM = %5.2f\n', EB);

