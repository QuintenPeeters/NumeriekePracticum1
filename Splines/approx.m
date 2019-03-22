function approx()

    aantal_punten = 9;

    x = 0:2*pi/(aantal_punten-1):2*pi;
    fprintf('%s points.\n',num2str(length(x)));
    y = sin(x);
    y = y(1:end-1);
    t = x;
    
    periospline(x, y, t);
end