
function y = periospline(x,f,t)
    % x is een vector van lengte n+1 met de abscissen
    % f is een (d x n) matrix met de functiewaarden van d verschilende
    % functies
    % t is een vector van lengte N waar de periodieke splines gevalueerd
    % moeten worden
    % y is een (d x N) matrix met in de d rijen de gevalueerde splines
    % in de punten t
    
    Punten_per_spline = 500;
    
    [d, n] = size(f);
    N = length(t);
    
    y = zeros(d, N);

    for i = 1:d
       yy = f(i, :);
       yy(n+1) = f(i, 1);
       func = makeSpline(x, yy);
       
       for k = 1:n
           xx = x(k):delta(x, k+1)/Punten_per_spline:x(k+1);
           h = func{k}(xx);
           plot (xx, h);
           hold on;
       end
       
       Y = zeros(1, N);
       
       for j = 1:N
           Y(j) = evaluateSplineAt(func, x, t(j));
       end
       
       y(i, :) = Y;
       
       
    end
    
    hold off
    
end

function y = makeSpline(x, f)
    % y is een vector van lengte n dat alle functies p(x) bevat in de
    % deelintervallen
    % x is de vector van abscissen van lengte n+1
    % f is de vector van functiewaarden van lengte n+1
        
    n = length(x)-1;
    coefMatrix = zeros(n+1, n+1);
    rechterlid = zeros(1, n+1);
    
    % first row
    coefMatrix(1, 1) = 2*(delta(x, n+1)+delta(x, 2));
    coefMatrix(1, 2) = delta(x, 2);
    coefMatrix(1, n+1) = delta(x, n+1);
    
    rechterlid(1) = (delta(f, 2)/delta(x, 2)) - (delta(f, n+1)/delta(x, n+1));
    
    %last row
    coefMatrix(n+1, 1) = delta(x, n+1);
    coefMatrix(n+1, n) = delta(x, n);
    coefMatrix(n+1, n+1) = 2*(delta(x, n)+delta(x, n+1));
    
    rechterlid(n+1) = (delta(f, n+1)/delta(x, n+1)) - (delta(f, n)/delta(x, n));

    
    for i = 2:n
        coefMatrix(i, i-1) = delta(x, i);
        coefMatrix(i, i) = 2*(delta(x, i)+delta(x, i+1));
        coefMatrix(i, i+1) = delta(x, i+1);
        
        rechterlid(i) = (delta(f, i+1)/delta(x, i+1)) - (delta(f, i)/delta(x, i));
    end
    
    rechterlid = transpose(rechterlid);
    
    % s'' vector wordt dan
    global s;
    s = coefMatrix\rechterlid;
   
    y = cell(n, 1);
    
    for j = 1:n

        y{j} = @(t)( ( f ( j+1 ) * ( t-x ( j ) ) + ( f ( j ) * ( x ( j+1 )-t ) ) )/delta(x, j+1) ...
            + (1/6)*( power(t-x(j), 3)/delta(x, j+1) - delta(x, j+1)*(t - x(j)) )*(s(j+1)) ...
            - (1/6)*( power(t-x(j), 3)/delta(x, j+1) + delta(x, j+1)*(x(j+1)-t) )*(s(j)) );
    end

end

function y = evaluateSplineAt(func, x, P)
    % func is een cell Array van function handlers
    % x zijn de breekpunten van de spline
    % P is het punt dat gevalueerd moet worden
    
    n = length(x)-1;
    y = 0;
    
    for i = 1:n
        if (P >= x(i) && P <= x(i+1))
            z = func{i};
            y = z(P);
            break
        end
    end    
end

function y = delta(x, i)
    y = x(i)-x(i-1);
end