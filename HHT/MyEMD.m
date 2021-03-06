function imf = MyEMD(y,nCmps)
% MyEMD - Perform 1st order Empirical Mode Decomposition on input signal
% imf = MyEMD(y,nComps)
% Inputs:
% y - Signal on which to perform the decomposition. If y is a matrix then
%  treats each col as a signal
% nCmps - number of components (i.e. intrinsic mode functions)

if any(size(squeeze(y))==1)
    y = y(:);
elseif numel(size(squeeze(y))) > 2
    error('Input cannot have more than 2 dims')
end
imf = struct([]);
for cmp = 1:nCmps
    for col = 1:size(y,2)
    if cmp > 1
        y = [];
        y = imf(cmp-1).res;
    end
    [imf(cmp).comp(:,col), imf(cmp).res(:,col), imf(cmp).mx{col},imf(cmp).mn{col},...
        imf(cmp).maxEnv(:,col),imf(cmp).minEnv(:,col)] = GetCubic(y(:,col));     
    end
end


