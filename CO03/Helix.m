classdef Helix
    %description
    properties(Access=protected)
            trk; %a CdfTrack
    end
end

methods
    %constructor
    function obj = Helix(t)
        if nargin > 0
            obj(numel(t)) = Helix; %create an array of the right size
            for i = 1:numel(t)
                obj(i).trk = t(i)
            end
        end
    end
    end

    
    