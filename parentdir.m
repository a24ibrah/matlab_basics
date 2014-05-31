function [ pd ] = parentdir( inDir, nParent )
%[ pd ] = parentdir( dir, nParent ) get the nth parent of a directory
%   inDir   a string containing a directory (without a filenhame at the
%           end)
%   nParent which parent to get.  1 is the immediate parent.  2 is the
%           grandparent, etc. 
%           defaults to 1
%           if nParent is greater than the maximum number of parent
%           directories, this will return '/', the root directory
%
%   pd      the nth parent directory of inDir

if ~exist('nParent', 'var'); nParent = 1; end;

pd = inDir;
for ni = 1:nParent
    pd = fileparts(pd);
end


end

