function [X, si, sSorted] = sortby( X, s, dim, mode)
%[X, si] = sortby(X, s, dim): sort rows/cols of the matrix X by the values
%                             in vector s
% inputs:
%   X       an r by c matrix
%   s       a vector 
%   dim     the dimension to sort X along.  1 for rows, 2 for columns.
%           dim can be omitted if length(s) is uniquely equal to r or c
%           however, if r == c, dim must be specified
%   mode    selects the direction of the sort
%           'ascend' results in ascending order (default)
%           'descend' results in descending order
%
% outputs:
%   X       sorted version of X
%   si      the indices to which the elements of s were sorted.  just like
%           the output indices from Matlab's sort function
%   sSorted sorted version of s

[r c] = size(X);
ls = length(s);

if exist('dim', 'var')
    if ischar(dim)
        error('the dim argument cannot be a string');
    end
    if length(dim) > 1
        error(['dim should have length 0 or 1, but as has length ' ...
            num2str(length(dim))]);
    end
end
        
if r == c
    if ~exist('dim', 'var'); 
        error('dim must be specified if X is square');
    elseif dim ~= 1 && dim ~= 2
        error(['with square X, dim must be either 1 to sort along ' ...
               'rows or 2 to sort along cols']);
    end
elseif ls == r
    dim = 1;
elseif ls == c
    dim = 2;
else
    error(['the length of s must be equal to either the number of ' ...
            'rows or the number of columns in X']);
end

hadMode = true;
if ~exist('mode', 'var')
    hadMode = false;
    mode = 'ascend';
elseif ~strcmpi(mode, 'ascend') && ~strcmpi(mode, 'descend')
    error('mode must be one of either "ascend" or "descend"');
end

if ~iscell(s)
    [sSorted, si] = sort(s,mode);
else
    if hadMode
        error(['the Matlab function "sort" cannot use the mode ' ...
        'argument with a cell array'])
    end
    [sSorted, si] = sort(s);
end
if dim == 1
    X = X(si, :);
else 
    X = X(:, si);
end


end

