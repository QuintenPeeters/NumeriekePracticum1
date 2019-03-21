function y = periospline(x,f,t)
    % x is een vector van lengte n+1 met de abscissen
    % f is een (d x n) matrix met de functiewaarden van d verschilende
    % functies
    % t is een vector van lengte N waar de periodieke splines gevalueerd
    % moeten worden
    % y is een (d x N) matrix met in de d rijen de gevalueerde splines
    % in de punten t
    [d, n] = size(f);
    N = length(t);
    
    y = zeros(d, N);

    for i = 1:d
       yy = f(i, :);
       yy(n+1) = f(i, 1);
       func = makeSpline(x, yy);
       
       Y = zeros(1, N);
       
       for j = 1:N
           Y(j) = evaluateSplineAt(func, x, t(j));
       end
       
       y(i) = Y;
    end
    
end