%
function img2txt_demo(imfile,im_name)
%IMG2TXT Converts an image to ASCII text
%
%   img2txt(imfile) converts the image contained in the specified file
%                   using an ASCII character for every pixel in x-dimension
%   img2txt(imfile,stepx) converts the image contained in the specified file
%                   using an ASCII character for every stepx pixels in x-dimension


% imfile='image_anisotropic/image20_anisotropic.jpg';
% [im_path, im_name, im_ext]=fileparts(imfile);




ramp=['@@@@@@@######MMMBBHHHAAAA&&GGhh9933XXX222255SSSiiiissssrrrrrrr;;;;;;;;:::::::,,,,,,,........'];
  % the 'ramp' vector represents characters in order of intensity
im=imread(imfile);
im=mean(im,3);

dst_folder = './textfile_output/';
im_outname = [dst_folder,im_name,'_stepx_1_txt','.txt'];
fid=fopen(im_outname,'w');

stepx=1;
% if length(varargin)>0,
%   stepx=varargin{1};
% end
stepy=2*stepx;
sizx=fix(size(im,2)/stepx);
sizy=fix(size(im,1)/stepy);
lumin=zeros(sizy,sizx);
for j=1:stepy
  for k=1:stepx
    lumin=lumin+im(j:stepy:(sizy-1)*stepy+j,k:stepx:(sizx-1)*stepx+k);
  end
end
str=ramp(fix(lumin/(stepx*stepy)/256*length(ramp))+1);
for h=1:sizy
  fwrite(fid,[str(h,:),13,10]);
end
fclose(fid);
end
