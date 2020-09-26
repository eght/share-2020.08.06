%% varargin 
% Variable-length input argument list
% 
% https://www.mathworks.com/help/matlab/ref/varargin.html?s_tid=srchtitle
% file name: acceptVariableNumInputs.m
% date: 2020.09.26
% author: claude
% usage: >> acceptVariableNumInputs(ones(3),'some text',pi)
% help: >> type acceptVariableNumInputs
%
% Number of input arguments: 3
%  
% varargin{1} =
%  
%      1     1     1
%      1     1     1
%      1     1     1
% 
%  
%  
% varargin{2} =
%  
% some text
%  
%  
% varargin{3} =
%  
%     3.1416
% 
% 
function acceptVariableNumInputs(varargin)
    disp("Number of input arguments: " + nargin)
    celldisp(varargin)
end
