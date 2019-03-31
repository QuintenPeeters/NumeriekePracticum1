function stripfiguur()
    
    aantal_punten = 500;
    aantal_punten_per_spline = 1000;
    aantal_vormen = 6;
    
    AA = cell(aantal_vormen, 1);
    
    figure;
	axis([0 1 0 1]);
	axis manual
	title('Click left to draw polyline, click right to terminate')
	hold on;
    for k=1:aantal_vormen
        AA{k} = click();
        hold on;
    end
    hold off
    for k=1:aantal_vormen
        [~, n] = size(AA{k});
        
        % TODO: x veranderen van de index naar de afstand tussen de
        % opeenvolgende punten
        x = 0:1:n;
        y = AA{k};
        t = (0:n/(aantal_punten_per_spline*aantal_punten-1):n);
        AA{k} = periospline(x, y, t);
    end
    for k=1:aantal_vormen
        plot(AA{k}(1, :), AA{k}(2, :))
        hold on
    end
    
    hold off
end