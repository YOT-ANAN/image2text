%reading
fname = 'image07.jpg';
im=imread(fname);

%rgb2gray
gim=rgb2gray(im);
%figure(1), imshow(gim), title('Gray image');

%histogram
imhist(gim)

bim_bw = im2bw(gim);
figure(2), imshow(bim_bw), title('Matlab BW image');


%imadjust
%imadjust[image,[low_in high_in],[low_out high_out],gamma]   
%lowhigh=stretchlim(gim);
gim = imadjust(gim,[0.114 0.882],[0.4 .78]);
figure(3), imshow(gim), title('imadjust');

bim_imadjust = im2bw(gim);
figure(4), imshow(bim_imadjust), title('Matlab BW imageadjust');


