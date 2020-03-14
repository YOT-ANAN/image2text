function win = centerCropWindow2dEdit(inputSize,targetSize)


narginchk(2,2)

inputSize = manageChannelDims(inputSize);
targetSize = manageChannelDims(targetSize);

validateattributes(inputSize,{'numeric'},{'vector','numel',2,'integer','nonsparse','real'});
validateattributes(targetSize,{'numeric'},{'vector','numel',2,'integer','nonsparse','real'});

if any(targetSize > inputSize)
    error(message('images:cropwindow:targetSizeTooBigForInputImageSize'));
end

% When in a dimension inputDim-targetDim is non-even, we arbitrarily choose
% ceil when forming the cropping window.
startPos = 1 + ceil((inputSize - targetSize)/2);

% xLimits = [startPos(2),startPos(2)+targetSize(2)-1]
% yLimits = [startPos(1),startPos(1)+targetSize(1)-1]



% RECT is either a 4-element vector with the form [XMIN YMIN WIDTH HEIGHT];
% win = images.spatialref.Rectangle(xLimits,yLimits);
win = [startPos(2) startPos(1) startPos(1)+targetSize(1)-1 startPos(2)+targetSize(2)-1];
end

function szOut = manageChannelDims(sz)

if isvector(sz) && numel(sz) == 3
    szOut = sz(1:2);
else
    szOut = sz;
end

end