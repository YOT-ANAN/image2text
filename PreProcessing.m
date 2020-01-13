classdef PreProcessing < handle
    properties(Access = protected)
         imName='';
         imIn  =[];
         imOut =[0 0 0];
         methodName = '';
    end
    methods(Abstract,Access = protected)
        process(obj);
    end
  methods
         function  obj = PreProcessing (imName,imIn)
                 if nargin > 0
                    obj.imName=imName;
                    obj.imIn=imIn;
                 end
         end
         function imOut=getIm(obj)
             imOut=obj.imOut;
         end
  end
    methods (Access = protected)
        function imWriteOut (obj)
            dstFolder = ['.\',obj.methodName,'_image\'];
            imExt = '.jpg';
            fullPath = [dstFolder,obj.imName,imExt];
            if ~exist(dstFolder, 'dir')
                mkdir(dstFolder)
            end
            imwrite (obj.imOut,fullPath);
        end
     end   
  
end
