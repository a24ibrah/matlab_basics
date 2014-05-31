function [ f ] = ff( varargin )
%FF(folderName1, folderName2, ..., fileName) wrapper for fullfile
f = fullfile(varargin{:});

end

