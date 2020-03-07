im=imread('peppers.png');
targetSize = [200 300];
r = centerCropWindow2d(size(im),targetSize);

J = imcrop(im,r);
imshow(J)
