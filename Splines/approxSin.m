function approxSin()

    aantal_punten = 20;
    aantal_punten_per_spline = 500;

    x = 0:2*pi/(aantal_punten-1):2*pi;
    fprintf('%s points.\n',num2str(length(x)));
    y = sin(x) + sin(4*x)/2;
    
    for i = 1:aantal_punten
       plot(x(i),y(i),'-o');
       hold on
    end
    
    y = y(1:end-1);
    t = (0:2*pi/(aantal_punten_per_spline*aantal_punten-1):2*pi);
    
    Y = periospline(x, y, t);
    hold on
    plot(t, Y);
    hold off

end