function new_im = imresizeandcrop(im)

   %im = imread('.\image_test\image52.jpg');

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


%     figure(1)
%     imshow(im)
%     figure(2)
%     imshow(new_im)
end
