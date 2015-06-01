function install(installflag)
% INSTALL  Installation file for FastSpecialMat
%
%   INSTALL(1) installs FastSpecialMat under the userpath/FastSpecialMat.
%   The path to installed FastSpecialMat will be added in 'startup.m' such that
%   the FastSpecialMat will be included automatically.
%
%   INSTALL(-1) uninstall FastSpecialMat and delete all the files.

%   Copyright (c) 2015 Yingzhou Li, Stanford University

if( nargin == 0 )
    installflag = 1;
end

src_path = ['src' filesep];
install_path = strsplit(userpath,pathsep);
matlab_startup_file = [install_path{1} filesep 'startup.m'];
install_path = [install_path{1} filesep 'FastSpecialMat' filesep];

% uninstall, installflag<0
if(installflag < 0)
    if(exist(install_path, 'dir'))
        rmpath([install_path 'src' filesep]);
        rmdir(install_path,'s');
    end
    if(exist(matlab_startup_file, 'file'))
        startup_path_data = importdata(matlab_startup_file);
        fid = fopen(matlab_startup_file, 'w+');
        for i=1:length(startup_path_data)
            if(~strcmp(startup_path_data{i},...
                ['run ' install_path 'FSM_startup.m']))
                fprintf(fid,'%s\n',startup_path_data{i});
            end
        end
        fclose(fid);
    end
    return;
end

% install
if(installflag >= 0)
    if(~exist(install_path, 'dir'))
        mkdir(install_path);
    end
    if(~exist([install_path 'src'], 'dir'))
        mkdir([install_path 'src']);
    end
    copyfile('FSM_startup.m',install_path);
    copyfile([src_path '*'],[install_path 'src']);
    fid = fopen(matlab_startup_file, 'at');
    fprintf(fid, '%s\n', ['run ' install_path 'FSM_startup.m']);
    fclose(fid);
    run([install_path 'FSM_startup.m']);
    return;
end

end
