%% 
m = 25;
n = 25;
F3 = double(imread('etna.jpg'));
[M,N] = size(F3);
x = linspace(-1,1,N);
y = linspace(-1,1,M);
[X,Y] = meshgrid(x,y);
C3 = kkb(x,y,F3,m,n);
v3 = polyval2(C3,x,y);


hold on
%imagesc(F3);
surf(X,Y,v3,'EdgeColor','none','LineStyle','none','FaceLighting','phong'); 
xlim([-1,1]); ylim([-1,1]); zlim([0, 250]);
title('Etna');
hold off