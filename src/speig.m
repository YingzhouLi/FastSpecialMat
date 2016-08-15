function varargout = speig(A)
% SPEIG Eigenvalues and eigenvectors for symmetric sparse matrix.
%     E = SPEIG(A) produces a column vector E containing the eigenvalues of
%     a symmetric sparse matrix A.
%
%     [V,D] = SPEIG(A) produces a diagonal sparse matrix D of eigenvalues
%     and a sparse unitary matrix V whose columns are the corresponding
%     eigenvectors so that A = V*D*V'.

%   Copyright (c) 2015-2016 Yingzhou Li, Stanford University

p = amd(A);
n = size(A,1);
Aperm = A(p,p);
[t,~] = etree(Aperm);
idx0 = find(t == 0);
len0 = length(idx0);
if nargout == 1
    E = zeros(n,1);
    offset = 1;
    for it = 1:len0
        idx = offset:idx0(it);
        E(idx) = eig(full(Aperm(idx,idx)));
        offset = idx0(it)+1;
    end
    E(p) = E;
    varargout{1} = E;
else
    E = zeros(n,1);
    V = cell(n,1);
    offset = 1;
    for it = 1:len0
        idx = offset:idx0(it);
        [Vsub,Dsub] = eig(full(Aperm(idx,idx)));
        V{it} = sparse(Vsub);
        E(idx) = diag(Dsub);
        offset = idx0(it)+1;
    end
    spV = blkdiag(V{:});
    spV(p,p) = spV;
    E(p) = E;
    varargout{1} = spV;
    varargout{2} = sparse(1:n,1:n,E,n,n);
    
end

end