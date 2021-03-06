function y = FastCirculantVec(c,x)
% FASTCIRCULANTVEC  Fast application of circulant matrix.
%   y = FASTCIRCULANTVEC(c,x) applies circulant matrix generated by c
%   to vectors x. y returns the matrix vector product y = Cx,
%   where C is a circulant matrix generated by c,
%       -                                  -
%       |  c1    cn   cn-1 ...   c3    c2  |
%       |  c2    c1    cn  ...   c4    c3  |
%   C = |  c3    c2    c1  ...   c5    c4  | .
%       | ...   ...   ...  ...  ...   ...  |
%       | cn-1  cn-2  cn-3 ...   c1    cn  |
%       |  cn   cn-1  cn-2 ...   c2    c1  |
%       -                                  -
%
%   See also FASTCIRCULANTVEC, FASTHANKELVEC, FASTTOEPLITZVEC.

%   Copyright (c) 2015 Yingzhou Li, Stanford University

y = ifft(fft(c).*fft(x));

end
