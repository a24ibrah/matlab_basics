function [ X ] = probnorm( X, dim )
%[ X ] = probnorm( X, dim ) normalize matrix X along dimension dim
%   afterwards, all(sum(X, dim)==1)
if ~exist('dim', 'var'); dim=2; end;
X = bsxfun(@rdivide, X, sum(X, dim));
end

