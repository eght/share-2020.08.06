%%%%%%%%%%%%%%%%%%%%%%%%%
%% file name: mpfile01.mp
%% usage: 1. mpost mpfile01.mp
%%        2. WinEdt 10 Build: 20170413  (v. 10.2) - 64-bit
%%           MetaPost Shift+Ctrl+M
%% output: mpfile01-1.mps, mpfile01-7.mps, mpfile01-8.mps,
%% date: 2020.08.24
%%%%%%%%%%%%%%%%%%%%%%%%

outputtemplate := "%j-%c.mps";
outputformat   := "mps";
beginfig (1);
  % draw a line
  draw (1cm,2cm) -- (3cm,5cm);
  pickup pencircle scaled 4pt;
endfig;

beginfig(7)for a=0 upto 9:draw (0,0){dir 45}..{dir -10a}(6cm,0);
endfor
endfig;

beginfig(8)for a=0 upto 7:draw (0,0){dir 45}..{dir 10a}(6cm,0);
endfor
endfig;

end.
