classdef AdaptiveTMethod < PreProcessing
    properties (Access = protected)
        threshold=0;
        neighbourhood =[];
    end
    methods
        function obj = AdaptiveTMethod(imName,imIn)
          obj.imName = imName;
          obj.imIn=imIn;
          obj.methodName = 'adaptive';
          obj.threshold=10;
          obj.neighbourhood=[15 15];
          obj.imOut=[];
          obj.process();
          obj.imWriteOut();
        end
    end
    methods (Access = protected )
        function process(obj)
            gim=rgb2gray(obj.imIn);
            obj.imOut=bradley(gim,obj.neighbourhood,obj.threshold);
        end
    end
end

