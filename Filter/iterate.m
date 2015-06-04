function [x,P] = iterate(x, P, z, R, hfun, hjac, idf, N)
    % Inputs:
    %    zf  - range-bearing observations(old)
    %    Rf  - observations' covariance.
    %   hfun - function for computing the innovation, given the non-linear observation model: v = hfun(x,z).
    %   hjac - function for computing the observation model jacobian: H = hjac(x).
    %    N   - iterative number of IEKF measurement update.
    %
    % Outputs:
    %   x - a posteri state.
    %   P - a posteri covariance.
    % Cite from Tim Bailly.

    xo  = x; % Prior vector
    Po  = P;
    Poi = inv(P);
    Ri  = inv(R);
    for i = 1:N
        H = feval(hjac, x ,idf); 
        Y = feval(hfun, x, z, idf);
        P = calculateP(Po, H, R);
        x = xCompute(Y, x, P, xo, Poi, H, Ri); 
    end
    H = feval(hjac, x ,idf); 
    P = calculateP(Po, H, R);
end
%%
function P = calculateP(P, H, R)
    S  = H * P * H' + R;
    K  = P * H' / S;
    P  = P - K * H * P; % A\b for Inv(A) and b/A for b*Inv(A)
    P  = (P + P')/2;    % For assurance
end
%%
function x = xCompute(v, x, P, xo, Poi, H, Ri)
    M1 = P * H' * Ri; 
    M2 = P * Poi * (x - xo);
    x  = x + M1 * v - M2;
end