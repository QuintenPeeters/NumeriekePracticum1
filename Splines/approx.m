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
    
    x = 0:1:n;
    y = A;
    t = (0:n/(aantal_punten_per_spline*aantal_punten-1):n);
    
    
    Y = periospline(x, y, t);
    plot(Y(1, :), Y(2, :));
    hold off;
end