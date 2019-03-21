function y = evaluateSplineAt(func, x, P)
    % func is een cell Array van function handlers
    % x zijn de breekpunten van de spline
    % P is het punt dat gevalueerd moet worden
    
    n = length(x)-1;
    y = 0;
    
    for i = 1:n
        if (P >= x(i) && P <= x(i+1))
            y = func{i}(P);
            break
        end
    end    
end