function z = sample_categorical(p)
% p does not need to add up to 1
  cdf = cumsum(p(:));
  if cdf(end) <= 0
    error('distribution is all zeros');
  end
  z = sum(cdf < rand*cdf(end)) + 1;
end
