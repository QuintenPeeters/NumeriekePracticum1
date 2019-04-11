%% 
m = 7;
n = 7;
M = 31;
N = 31;
x = linspace(-1,1,M);
y = linspace(-1,1,N);
[X,Y] = meshgrid(x,y);
Xvec = X(:);
Yvec = Y(:);

F2 = membrane(1,15);
F2vec = F2(:);
C2 = kkb(x,y,F2,m,n);
v2 = polyval2(C2,x,y);

hold on
surf(X,Y,v2);
scatter3(Xvec,Yvec,F2vec,10,'red','filled');
hold off