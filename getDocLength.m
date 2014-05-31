function [ nLines, nWords, nBytes ] = getDocLength( fileName )

[status, output] = unix(['wc ' fileName]);
assert(status==0);

c = regexp(output, ' ', 'split');
c = cellfun(@str2double, c, 'UniformOutput', false);
c = cell2mat(c);
c = c(~isnan(c));

nLines = c(1);
nWords = c(2);
nBytes = c(3);

end