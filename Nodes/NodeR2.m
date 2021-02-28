%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   An implementation of the BaseNode class. 
%
%   This is a 2D linear node. This should be generalized into multidimensional
%   linear class (perhaps add another Abstract class that inhertics from
%   BaseNode).
%   
%   Amro Al Baali
%   23-Feb-2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
classdef NodeR2 < BaseNode
    %NODER2 Implementation of BaseNode on elements of R^2 space.    
    methods (Access = public)
        % Constructor
        function obj = NodeR2( varargin)
            % Call base constructor to initialize value if necessary.
            obj = obj@BaseNode( varargin{:}, 'dim', 2, 'dof', 2);
        end
    end
    
    methods (Static = true)
        % Static methods can be accessed without instantiating an object. These
        % can be used to access the node type and degrees of freedom (properties
        % that are not specific to any implementation)
        
        
        % Increment value
        function value_out = oplus(value_in, xi)
            % Linear case
            value_out = value_in + xi;
        end
        
        % Check validity of the element
        function isvalid = isValidValue( value_in)
            % Value should be a [2x1] column matrix
            isvalid = all( size( value_in) == [ 2, 1]);
                        
            isvalid = isvalid && all( ~isinf( value_in));
            isvalid = isvalid && all( ~isnan( value_in));
        end
        
        % Check validity of the increment
        function isvalid = isValidIncrement( increment)
            % This is the same as valid element
            isvalid = NodeR2.isValidValue( increment);
            
            isvalid = isvalid && all( ~isinf( increment));
            isvalid = isvalid && all( ~isnan( increment));
        end
    end
    
    properties (SetAccess = immutable)
        
        % Type of this node should match that class name
        type = string( mfilename);
        
        % Dimension of this node
        dim;
        
        % Degrees of freedom of this node
        dof;
    end          
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Explanation
%
%   --------------------------------------------------------------------------
%   Change log
%   --------------------------------------------------------------------------