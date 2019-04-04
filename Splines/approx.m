function approx()
    
    aantal_punten = 20;
    aantal_punten_per_spline = 500;

    
    figure;
	axis([0 1 0 1]);
	axis manual
	title('Click left to draw polyline, click right to terminate')
	hold on;
    A = click();
    hold off;
    
    [~, n] = size(A);
    
    % TODO: x veranderen van de index naar de afstand tussen de
    % opeenvolgende punten
%     x = 0:1:n;
    x = zeros(1, n+1);
    x(1) = 0;
    sum = 0;
    for i=1:n-1
        dist = sqrt( power( (A(1, i+1) - (A(1, i))) , 2) + power( (A(2, i+1) - (A(2, i))) , 2) );
        x(i+1) = sum + dist;
        sum = sum + dist;
    end
    x(n+1) = sum + sqrt( power( (A(1, 1) - (A(1, n))) , 2) + power( (A(2, 1) - (A(2, n))) , 2) );
    y = A;
    t = (0:x(n+1)/(aantal_punten_per_spline*aantal_punten-1):x(n+1));    
    
    Y = periospline(x, y, t);
    plot(Y(1, :), Y(2, :));
    hold off;
end