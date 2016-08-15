n = 2000;
density = 0.5/n;
A = sprand(n,n,density);
A = (A+A')/2;

%% Only eigenvalues are calculated
disp(['The calculation for eigenvalues with symmetric matrix of size ' ...
    num2str(n)]);
tic;
Esp = speig(A);
speigtime = toc;
disp(['The running time for speig is ' num2str(speigtime) ' seconds.']);
tic;
E = eig(full(A));
eigtime = toc;
disp(['The running time for eig is ' num2str(eigtime) ' seconds.']);
disp(['The 2-norm error for different eigs is ' ...
    num2str(norm(sort(Esp)-sort(E),2))]);

disp(['The speig is ' num2str(eigtime/speigtime) ...
    ' times faster than eig.']);

disp('===============================================================');

%% Both eigenvalues and eigenvectors are calcuated
disp(['The calculation for both eigenvalues and eigenvectors with '...
    'symmetric matrix of size ' num2str(n)]);
tic;
[Vsp,Dsp] = speig(A);
speigtime = toc;
disp(['The running time for speig is ' num2str(speigtime) ' seconds.']);
disp(['The 2-norm error for speig is ' ...
    num2str(norm(full(Vsp*Dsp*Vsp'-A)))]);
disp(['The 2-norm error for orthnormality of V is ' ...
    num2str(norm(full(Vsp*Vsp'-eye(n))))]);
tic;
[V,D] = eig(full(A));
eigtime = toc;
disp(['The running time for eig is ' num2str(eigtime) ' seconds.']);
disp(['The 2-norm error for eig is ' num2str(norm(full(V*D*V'-A)))]);
disp(['The 2-norm error for orthnormality of V is ' ...
    num2str(norm(V*V'-eye(n)))]);

disp(['The speig is ' num2str(eigtime/speigtime) ...
    ' times faster than eig.']);