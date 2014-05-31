function [uElements, uCounts, uElements2v, v2uElements] = countUnique(v)
% [uElements, uCounts, uElements2v, v2uElements] = countUnique(v) count the number of
% times each unique item appears in a vector
%   v           a vector of length n
%   uElements   a vector which contains the m unique items in v.  
%               note than m <= n
%   uCounts     a vector of length m which lists the number of times that
%               each element in uElements appears in v
%   uElements2v gives the last index in v where each unique element shows
%               up for the last time
%   v2uElements gives the index in uElements where each element of v
%               appears
%
%
%   e.g.:
%     [a, b] = countUnique([2,5,3,4,2,2,5,5])
%     a =
%          3     1     1     3
%     b =
%          2     3     4     5
% 
%     [a, b]=countUnique({'a', 'b', 'a', 'c'})
%     a =
%          2     1     1
%     b = 
%         'a'    'b'    'c'
%
%   this is useful for converting sequence of words into bag of words

[uElements, uElements2v, v2uElements] = unique(v);
uCounts = histc(v2uElements, 1:length(uElements));
