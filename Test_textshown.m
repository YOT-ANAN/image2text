%
% function img2txt(imfile,varargin);
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

imfile='image01.jpg';
[im_path, im_name, im_ext]=fileparts(imfile);


ramp=['@@@@@@@######MMMBBHHHAAAA&&GGhh9933XXX222255SSSiiiissssrrrrrrr;;;;;;;;:::::::,,,,,,,........'];
  % the 'ramp' vector represents characters in order of intensity
im=imread(imfile);
im=mean(im,3);

dst_folder = './output_textfile/';
im_outname = [dst_folder,im_name,'_stepx_1_txt','.txt'];
fid=fopen(im_outname,'w');
% stepx=1;
stepx=1;
% if length(varargin)>0,
%   stepx=varargin{1};
% end
stepy=2*stepx;
sizx=fix(size(im,2)/stepx);
sizy=fix(size(im,1)/stepy);
lumin=zeros(sizy,sizx);
for j=1:stepy,
  for k=1:stepx,
    lumin=lumin+im(j:stepy:(sizy-1)*stepy+j,k:stepx:(sizx-1)*stepx+k);
  end
end

str=ramp(fix(lumin/(stepx*stepy)/256*length(ramp))+1);
textim=ones(1000);



i=0;
for h=1:sizy,
  fwrite(fid,[str(h,:),13,10]);
 textim=insertText(textim,[0 i],str(h,:),'BoxOpacity',0,'FontSize',4,'Font','Courier New');
 i=i+4;
end
imwrite(textim,'textim.jpg');
imshow(textim)
fclose(fid);
