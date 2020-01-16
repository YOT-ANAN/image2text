classdef AnisotropicDMethod < PreProcessing
    properties (Access = protected)
        num_iter = 0;
        delta_t = 0;
        kappa = 0;
        option = 0;
    end
    methods
        function obj = AnisotropicDMethod(imName,imIn)
          obj.imName = imName;
          obj.imIn=imIn;
          obj.imOut=[];
          obj.methodName = 'anisotropic';
          
          obj.num_iter = 5;
          obj.delta_t = 1/15;
          obj.kappa = 1;
          obj.option = 1;
          
          obj.process();
          obj.imWriteOut();
          

        end
    end
    methods (Access = protected )
        function process(obj)
            aniso_gim = anisodiff(obj.imIn,obj.num_iter,obj.delta_t,obj.kappa,obj.option);
            obj.imOut = imbinarize(aniso_gim);
            obj.imOut = im2uint8(obj.imOut);
            
        end
    end
end

