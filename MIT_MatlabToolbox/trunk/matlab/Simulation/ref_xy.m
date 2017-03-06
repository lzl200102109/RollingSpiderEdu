
function [sys,x0,str,ts] = ref_xy(t,x,u,flag)
    switch flag
        case 0
            [sys,x0,str,ts]=mdlInitializeSizes(); % Initialization
        case 3
            sys = mdlOutputs(t); % Calculate outputs
        case {1, 2, 4, 9 } % Unused flags
            sys = [];
        otherwise
            error(['Unhandled flag = ',num2str(flag)]); % Error handling
    end
end % End of flyer2dynamics

%==============================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the
% S-function.
%==============================================================
%
function [sys,x0,str,ts] = mdlInitializeSizes()
    %
    % Call simsizes for a sizes structure, fill it in and convert it
    % to a sizes array.
    %
    sizes = simsizes;
    sizes.NumContStates  = 0;
    sizes.NumDiscStates  = 0;
    sizes.NumOutputs     = 2;
    sizes.NumInputs      = 0;
    sizes.DirFeedthrough = 0;
    sizes.NumSampleTimes = 1;
    sys = simsizes(sizes);
    %
    % Initialize the initial conditions.
    x0 = [];
    %
    % str is an empty matrix.
    str = [];
    %
    % Generic timesample
    ts = [0 0];
    
end % End of mdlInitializeSizes.

%==============================================================
% mdlOutputs
% Calculate the output vector for this timestep
%==============================================================
%
function sys = mdlOutputs(t)

calibCycles   = 2;
takeoffCycles = 1;
refCycles = 5;
waitCycles = calibCycles + takeoffCycles + 1;

if (t > waitCycles && t <= waitCycles + refCycles)
    x_ref = 0;
    y_ref = (t - waitCycles)/refCycles;
elseif ((t > waitCycles + refCycles && t <= waitCycles + 2*refCycles))
    x_ref = (t - waitCycles - refCycles)/refCycles;
    y_ref = 1;
elseif ((t > waitCycles + 2*refCycles && t <= waitCycles + 3*refCycles))
    x_ref = 1;
    y_ref = 1 - (t - waitCycles - 2*refCycles)/refCycles;
elseif ((t > waitCycles + 3*refCycles && t <= waitCycles + 4*refCycles))
    x_ref = 1 - (t - waitCycles - 3*refCycles)/refCycles;
    y_ref = 0;
else
    x_ref = 0;
    y_ref = 0;
end

sys = [x_ref; y_ref];

end
% End of mdlOutputs.
