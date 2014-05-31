function z = sample_categorical1(p)
% p DOES need to add up to 1
  cdf = cumsum(p(:));
  if cdf(end) <= 0
    error('distribution is all zeros');
  end
  z = sum(cdf < rand) + 1;
end
