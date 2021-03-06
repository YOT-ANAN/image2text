

im = imread('.\image_test\image52.jpg');

h=size(im,1);
w=size(im,2);

if(w>h)
    im=imresize(im,[500 NaN]);
else
    im=imresize(im,[NaN 500]);
end

targetSize = [500 500];
r = centerCropWindow2d(size(im),targetSize);
new_im = imcrop(im,r);


figure(1)
imshow(im)
figure(2)
imshow(new_im)

% 
% if(w<500)
%     new_im=ones(500);
%     new_im=uint8(new_im);
%     d=round((500-w)/2);
%     new_im(1:500,d:d+w-1,1:3)=im;
%     im=new_im;
% end
% 
% 
% new_im=im;
% targetSize = [500 500];
% r = centerCropWindow2d(size(new_im),targetSize);
% new_im = imcrop(new_im,r);
% 
% 
% imshow(new_im);