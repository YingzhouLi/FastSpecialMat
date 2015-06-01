n = 1000;
k = 300;
c = single(rand(n,1));
r = single(rand(k,1));
r(1) = c(end);
c(1) = r(1);

%% Test Circulant Matrix
M = single(zeros(n));
for i = 1:n
M(:, i) = c;
c = [c(n) ; c(1:n-1)];
end
x = single(rand(n,1));
ysingle = M*x;
yfast = FastCirculantVec(M(:,1),x);
ydouble = double(M)*double(x);
disp('Circulant Matrix Check');
disp(['Difference between single precision and fast application: '...
      num2str(norm(ysingle-yfast))]);
disp(['Difference between double precision and fast application: '...
      num2str(norm(ydouble-yfast))]);


%% Test Hankel Matrix
M = hankel(c,r);
x = single(rand(k,1));
ysingle = M*x;
yfast = FastHankelVec(c,r,x);
ydouble = double(M)*double(x);
disp('Hankel Matrix Check');
disp(['Difference between single precision and fast application: '...
      num2str(norm(ysingle-yfast))]);
disp(['Difference between double precision and fast application: '...
      num2str(norm(ydouble-yfast))]);


%% Test Hankel Circulant Matrix
M = single(zeros(n));
for i = 1:n
M(:, i) = c;
c = [c(2:n) ; c(1)];
end
x = single(rand(n,1));
ysingle = M*x;
yfast = FastHankelCircVec(M(:,1),x);
ydouble = double(M)*double(x);
disp('Hankel Circulant Matrix Check');
disp(['Difference between single precision and fast application: '...
      num2str(norm(ysingle-yfast))]);
disp(['Difference between double precision and fast application: '...
      num2str(norm(ydouble-yfast))]);


%% Test Toeplitz Matrix
M = toeplitz(c,r);
x = single(rand(k,1));
ysingle = M*x;
yfast = FastToeplitzVec(c,r,x);
ydouble = double(M)*double(x);
disp('Toeplitz Matrix Check');
disp(['Difference between single precision and fast application: '...
      num2str(norm(ysingle-yfast))]);
disp(['Difference between double precision and fast application: '...
      num2str(norm(ydouble-yfast))]);


%% Test Toeplitz Symmetric Matrix
M = toeplitz(c);
x = single(rand(n,1));
ysingle = M*x;
yfast = FastToeplitzSymVec(c,x);
ydouble = double(M)*double(x);
disp('Toeplitz Symmetric Matrix Check');
disp(['Difference between single precision and fast application: '...
      num2str(norm(ysingle-yfast))]);
disp(['Difference between double precision and fast application: '...
      num2str(norm(ydouble-yfast))]);