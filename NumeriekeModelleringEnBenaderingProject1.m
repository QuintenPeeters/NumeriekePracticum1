%%
m=7;
n=7;
M = 31;
N = 31;

x = linspace(-1,1,M);
y = linspace(-1,1,N);
[X,Y] = meshgrid(x,y);
F1 = sin(((X.*2 - 1).^2 + Y.*2));
Xvec = X(:);
Yvec = Y(:);
F1vec = F1(:);
C1 = kkb(x,y,F1,m,n);
v1 = polyval2(C1,x,y);
v1vec = v1(:);

hold on
scatter3(Xvec,Yvec,F1vec,10,'red','filled');
surf(X,Y,v1);
hold off


