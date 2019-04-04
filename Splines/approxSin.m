function approxSin()

    aantal_punten =10;
    aantal_punten_per_spline = 500;
    y = @(x)(sin(x) + sin(4*x)/2);
    
    % Part one: plot the function with the points indicated
%     x = 0:2*pi/(aantal_punten-1):2*pi;
    x = [0, 0.50 ,1.114, 1.917, 2.881, 3.406, 4.374, 5.104,5.779, 2*pi];
    fprintf('%s points.\n',num2str(length(x)));
    f = y(x);
    figure;
    for i = 1:aantal_punten
       plot(x(i),f(i),'-o');
       hold on
    end
    
    f = f(1:end-1);
    t = (0:2*pi/(aantal_punten_per_spline*aantal_punten-1):2*pi);
    
    Y = periospline(x, f, t);
    hold on
    plot(t, Y);
    hold on
    plot(t, y(t));
    title("sin(x) + sin(4*x)/2 with " + aantal_punten + " points")
    xlabel("x");
    ylabel("y");
    hold on;
    hold off
    
    % Part two: plot the error curve with this number of points
    figure;
    plot(t, Y-y(t));
    title("Error curve with " + aantal_punten + " points")
    xlabel("x");
    ylabel("error");
    hold off;
    
%     % Part three: Plot the maximum error in function of number of points
%     figure;
%     t = (0:2*pi/1000:2*pi);
%     eval = y(t);
%     xxx = 3:1:5000;
%     yyy = zeros(98, 1);
%     for n=3:5000
%         x = 0:2*pi/(n-1):2*pi;
%         f = y(x);
%         f = f(1:end-1);
%         Y = periospline(x, f, t);
%         yyy(n-2) = max(Y-eval);
%     end
%     semilogy(xxx, yyy);
%     
%     xlabel("number of points");
%     ylabel("max error");
%     title("Max error in function of number of points");
%     hold off;
    
end