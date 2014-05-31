function p = dirichlet_logProb_matrix(alphas, data)
% p = dirichlet_logProb_matrix(alphas, data) log probability for a
% series of probability vectors and alphas
%
% inputs:
%   alphas  (nData x nDim)  matrix of dirichlet prior values.  each row is
%                           a different alpha vector.
%   data    (nData x nDim)  matrix of dirichlet random vectors. each row is
%                           a random vector.
% 
% outputs:
%   p       (nData x 1)     vector of probaiblity values, one for each row
%                           of the original alphas/data matrices


assert(all(size(alphas)==size(data)));

% row_sum is from the lightspeed toolbox. p is now nData x 1
p = row_sum(log(data) .* (alphas-1));
p = p + gammaln(row_sum(alphas)) - row_sum(gammaln(alphas));