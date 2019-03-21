function approxSin()

    aantal_punten = 3000;

    x = 0:2*pi/(aantal_punten-1):2*pi;
    fprintf('%s points.\n',num2str(length(x)));
    y = sin(x) + sin(4*x)/2;
    y = y(1:end-1);
    t = x;
    
    periospline(x, y, t);
end