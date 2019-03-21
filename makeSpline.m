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
    s = coefMatrix\rechterlid;
   
    y = cell(n, 1);
    
    for j = 1:n

        y{j} = @(t)( (f(j+1)*(t-x(j)) + (f(j)*(x(j+1)-x)))/delta(x, j+1) ...
            + (1/6)*( (t-x(j)).^3/delta(x, j+1) - delta(x, j+1)*(t - x(j)) )*(s(j+1)) ...
            - (1/6)*( (t-x(j)).^3/delta(x, j+1) + delta(x, j+1)*(x(j+1)-t) )*(s(j)) );
    end

end