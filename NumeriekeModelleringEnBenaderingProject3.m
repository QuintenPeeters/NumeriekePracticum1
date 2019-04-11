approx1 = zeros(20,1);
approx2 = zeros(20,1);
x = linspace(-1,1,31);
y = linspace(-1,1,31);
v = zeros(20,1);
[X,Y] = meshgrid(x,y);
F1 = sin((X.*2 - 1).^2 + Y.*2);
F2 = membrane(1,15);
for i = 1:20
    m = i;
    n = i;
    v(i,1) = i;
    
    C1 = kkb(x,y,F1,m,n);
    v1 = polyval2(C1,x,y);
    C2 = kkb(x,y,F2,m,n);
    v2 = polyval2(C2,x,y);
    
    approx1(i,1) = sum(sum((F1 - v1).^2),2);
    approx2(i,1) = sum(sum((F2 - v2).^2),2);
    
    
end

hold on
scatter(v,approx1,20,'red','filled');
scatter(v,approx2,20,'blue','filled');
title('kostfunctie');
hold off

