%BRADLEY local thresholding.
%   BW = BRADLEY(IMAGE) performs local thresholding of a two-dimensional
%   array IMAGE with Bradley method. The brief idea of the algorithm is
%   that every image's pixel is set to black if its brightness is T percent
%   lower than the average brightness of surrounding pixels in the window
%   of the specified size, otherwise it is set to white.
%      
%   BW = BRADLEY(IMAGE, [M N], T, PADDING) performs local
%   thresholding with M-by-N neighbourhood (default is 3-by-3). The default
%   value for T is 10 and can be set in range 0..100. To deal with border
%   pixels the image is padded with one of PADARRAY options (default is
%   'replicate').
%       
%   Example
%   -------
%       imshow(bradley(imread('eight.tif'), [25 25], 0.2));
%
%   See also PADARRAY, RGB2GRRAY.

%   Contributed by Jan Motl (jan@motl.us)
%   $Revision: 1.0 $  $Date: 2013/03/09 16:58:01 $

function output = bradley(image, varargin)
% Initialization
numvarargs = length(varargin);      % only want 3 optional inputs at most
if numvarargs > 3
    error('myfuns:somefun2Alt:TooManyInputs', ...
     'Possible parameters are: (image, [m n], T, padding)');
end
 
optargs = {[3 3] 10 0 'replicate'};   % set defaults
 
optargs(1:numvarargs) = varargin;   % use memorable variable names
[window, T, padding] = optargs{:};


% Convert to double
image = double(image);

% Mean value
mean = averagefilter(image, window, padding);

% Initialize the output
output = zeros(size(image));

% Set pixel to white if brightnes is above 100*(1-T)% of the neighbourhood
tmp=mean*(1-T/100);
output(image >= mean*(1-T/100)) = 1;

