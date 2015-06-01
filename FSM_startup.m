function FSM_startup()
% FSM_STARTUP  Startup file for Fast Special Matrix
%   MAKE adds paths of the FastSpecialMatrix to Matlab.

%   Copyright (c) 2015 Yingzhou Li, Stanford University

file_path = mfilename('fullpath');
tmp = strfind(file_path,'FSM_startup');
file_path = file_path(1:(tmp(end)-1));
addpath([file_path 'src']);

end
