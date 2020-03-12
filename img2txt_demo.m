%
function img2txt(imName,imIn)
%IMG2TXT Converts an image to ASCII text
%
%   img2txt(imfile) converts the image contained in the specified file
%                   using an ASCII character for every pixel in x-dimension
%   img2txt(imfile,stepx) converts the image contained in the specified file
%                   using an ASCII character for every stepx pixels in x-dimension
%

%   Copyright (c) by Federico Forte
%   Date:     2004/04/08
%   Revision: 2004/04/27

% imfile=['./anisotropic_image/',imName,'.jpg'];
% [im_path,im_name,im_ext]=fileparts(imfile);


ramp=['@@@@@@@######MMMBBHHHAAAA&&GGhh9933XXX222255SSSiiiissssrrrrrrr;;;;;;;;:::::::,,,,,,,        '];
% the 'ramp' vector represents characters in order of intensity
% im_folder=imread(imfile);
%




im=imIn;
size(imIn)
% im=imread(imfile);
im=mean(im,3);


dst_txt_folder = '.\output_textfile\';
dst_im_folder = '.\output_imagefile\';

dst_im_folder
 if ~exist(dst_txt_folder, 'dir')
     mkdir(dst_txt_folder)
    
 end
 
 if ~exist(dst_im_folder, 'dir')
     mkdir(dst_im_folder)
      
 end
 
im_output=ones(1000);
im_outname = [dst_im_folder,imName,'.jpg'];

txt_outname = [dst_txt_folder,imName,'.txt'];
fid=fopen(txt_outname,'w');



% stepx=1;
stepx=1;
% if length(varargin)>0,
%   stepx=varargin{1};
% end

stepy=2*stepx;

%stepx and stepy is character / stepx*stepy*2 pixel

sizx=fix(size(im,2)/stepx);
sizy=fix(size(im,1)/stepy);
lumin=zeros(sizy,sizx);

for j=1:stepy,
    for k=1:stepx,
        lumin=lumin+im(j:stepy:(sizy-1)*stepy+j,k:stepx:(sizx-1)*stepx+k);
    end
end
str=ramp(fix(lumin/(stepx*stepy)/256*length(ramp))+1);

i=0;
for h=1:sizy,
    fwrite(fid,[str(h,:),13,10]);
    im_output=insertText(im_output,[0 i],str(h,:),'BoxOpacity',0,'FontSize',4,'Font','Courier New');
    i=i+4;
end
fclose(fid);
imwrite(im_output,im_outname);
