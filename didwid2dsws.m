function [ ds, ws ] = didwid2dsws( filename, widsAreZeroIndexed, delimiter )

if ~exist('delimiter', 'var'); delimiter = ' '; end
if ~exist('widsAreZeroIndexed', 'var'); widsAreZeroIndexed = true; end


fid = fopen(filename, 'r');

[ndocs, nwords] = getDocLength(filename);

ds = zeros(nwords, 1);
ws = zeros(nwords, 1);

dcounter = 1;
wcounter = 0;
line = fgetl(fid);
while(ischar(line))
    if ~mod(dcounter, 1000); 
        disp(['Starting Line: ' num2str(dcounter) ' of ' num2str(ndocs)]); 
    end
    
    c = regexp(line, delimiter, 'split');
    c = cellfun(@str2double, c, 'UniformOutput', false);
    c = cell2mat(c);
    c = c(~isnan(c));
    
    nTokensHere = length(c);
    tokenIndices = wcounter+1:wcounter+nTokensHere;
    ws(tokenIndices) = c;
    ds(tokenIndices) = dcounter;
    
    wcounter = wcounter + nTokensHere;
    dcounter = dcounter + 1;
    
    line = fgetl(fid);
end
assert(dcounter-1 == ndocs);
assert(wcounter == nwords);

if widsAreZeroIndexed
    ws = ws+1;
end

end

