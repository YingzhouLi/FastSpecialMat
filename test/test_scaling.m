T_FastCirculant = zeros(1,12);
T_Circulant = zeros(1,12);
T_FastHankelCirc = zeros(1,12);
T_HankelCirc = zeros(1,12);
T_FastHankel = zeros(1,12);
T_Hankel = zeros(1,12);
T_FastToeplitz = zeros(1,12);
T_Toeplitz = zeros(1,12);
T_FastToeplitzSym = zeros(1,12);
T_ToeplitzSym = zeros(1,12);

nrange = 6:12;

for niter = nrange
n = 2^niter;
k = n;
c = rand(n,1);
r = rand(k,1);
r(1) = c(end);
c(1) = r(1);
x = rand(n,1);

%% Circulant Matrix
M = zeros(n);
for i = 1:n
M(:, i) = c;
c = [c(n) ; c(1:n-1)];
end
tic;
yfast = FastCirculantVec(M(:,1),x);
T_FastCirculant(niter) = toc;
tic;
y = M*x;
T_Circulant(niter) = toc;

%% Hankel Matrix
M = hankel(c,r);

tic;
yfast = FastHankelVec(c,r,x);
T_FastHankel(niter) = toc;
tic;
y = M*x;
T_Hankel(niter) = toc;

%% Hankel Circulant Matrix
M = zeros(n);
for i = 1:n
M(:, i) = c;
c = [c(2:n) ; c(1)];
end

tic;
yfast = FastHankelCircVec(M(:,1),x);
T_FastHankelCirc(niter) = toc;
tic;
y = M*x;
T_HankelCirc(niter) = toc;

%% Toeplitz Matrix
M = toeplitz(c,r);

tic;
yfast = FastToeplitzVec(c,r,x);
T_FastToeplitz(niter) = toc;
tic;
y = M*x;
T_Toeplitz(niter) = toc;

%% Symmetric Toeplitz Matrix
M = toeplitz(c);

tic;
yfast = FastToeplitzSymVec(c,x);
T_FastToeplitzSym(niter) = toc;
tic;
y = M*x;
T_ToeplitzSym(niter) = toc;

end

figure
subplot(3,2,1);
loglog(2.^nrange,T_FastCirculant(nrange),'-*b');
hold on;
loglog(2.^nrange,T_Circulant(nrange),'--xr');
title('Circulant Matrix');
legend('Fast','Normal','Location','NorthWest');


subplot(3,2,3);
loglog(2.^nrange,T_FastHankel(nrange),'-*b');
hold on;
loglog(2.^nrange,T_Hankel(nrange),'--xr');
title('Hankel Matrix');
legend('Fast','Normal','Location','NorthWest');

subplot(3,2,4);
loglog(2.^nrange,T_FastHankelCirc(nrange),'-*b');
hold on;
loglog(2.^nrange,T_HankelCirc(nrange),'--xr');
title('Hankel Circulant Matrix');
legend('Fast','Normal','Location','NorthWest');

subplot(3,2,5);
loglog(2.^nrange,T_FastToeplitz(nrange),'-*b');
hold on;
loglog(2.^nrange,T_Toeplitz(nrange),'--xr');
title('Toeplitz Matrix');
legend('Fast','Normal','Location','NorthWest');

subplot(3,2,6);
loglog(2.^nrange,T_FastToeplitzSym(nrange),'-*b');
hold on;
loglog(2.^nrange,T_ToeplitzSym(nrange),'--xr');
title('Toeplitz Symmetric Matrix');
legend('Fast','Normal','Location','NorthWest');