function y = FastHankelVec(c,r,x)
% FASTHANKELVEC  Fast application of Hankel matrix.
%   y = FASTHANKELVEC(c,r,x) applies Hankel matrix generated by c been the
%   first column and r been the last row to vectors x. Here we denote the
%   length of c as n and the length of r as k. y returns the matrix vector
%   product y = Hx, where H is a Hankel matrix generated by c and r,
%   if n >= k, the corresponding Hankel matrix is defined as
%       -                             -
%       |  c1    c2   ...  ck-1   ck  |
%       |  c2    c3   ...   ck   ck+1 |
%   H = |  c3    c4   ...  ck+1  ck+2 | ,
%       | ...   ...   ...  ...   ...  |
%       | cn-1   cn   ...  rk-2  rk-1 |
%       |  cn    r2   ...  rk-1   rk  |
%       -                             -
%   if n < k, the corresponding Hankel matrix is defined as
%       -                                   -
%       |  c1    c2    c3   ...  rk-1   rk  |
%       |  c2    c3    c4   ...   rk   rk+1 |
%   H = | ...   ...   ...   ...  ...   ...  | .
%       | cn-1   cn    r2   ...  rk-2  rk-1 |
%       |  cn    r2    r3   ...  rk-1   rk  |
%       -                                   -
%   Ideally, c(n) should be equal to r(1). If that does not hold, the
%   function will warn the user and use c(n) as the value on the diagonal.
%
%   See also FASTCIRCULANTVEC, FASTTOEPLITZVEC, FASTHANKELCIRCVEC.

%   Copyright (c) 2015 Yingzhou Li, Stanford University

n = size(c,1);
k = size(r,1);
if c(n) ~= r(1)
    warning(['Last element of input column does not match first element of'...
          ' input row. Column wins anti-diagonal conflict.']);
end
cext = [c;r(2:k)];
xext = [x;zeros(n-1,size(x,2))];
yext = flipud(ifft(fft(flipud(cext)).*fft(xext)));
y = yext(1:n,:);

end
