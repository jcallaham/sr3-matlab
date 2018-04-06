
function z = l012rhoprox(x,alpha,mode,ifprox)
%%L012RHOPROX utility function for the l0, l1, and l2 penalties
% this function returns either the value of the penalty or 
% the solution of the prox problem (if ifprox):
%
% argmin_z alpha* \|z\|_p + 0.5*\|x-z\|)2^2
%
% where p is one of 0, 1, 2. If ~ifprox, then \|x\|_p is
% returned where p is 0, 1, 2 according to mode. 
%
% input:
%   x - vector, as above
%   alpha - weight, as above
%   mode - string, '0' -> p = 0, etc.
%   ifprox - flag, as above
%

if strcmp(mode,'0')
    
    if ifprox
        z = wthresh(x,'h',sqrt(2*alpha));
    else
        z= nnz(x);
    end
    
elseif strcmp(mode,'1')
    
    if ifprox
        z = wthresh(x,'s',alpha);
    else
        z = sum(abs(x));
    end
    
elseif strcmp(mode,'2')
    
    if ifprox
        z = x/(1.0+alpha);
    else
        z = 0.5*sum(abs(x).^2);
    end
    
else
    warning('incorrect mode sent to l012rhoprox');
    if ifprox
        z = x;
    else
        z = 0.0;
    end
    
end