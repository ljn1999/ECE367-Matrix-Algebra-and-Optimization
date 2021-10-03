x = linspace(-1, 3.5);
y = linspace(-1, 3.5);

[X, Y] = meshgrid(x, y);

%part(b)
f1 = 2*X + 3*Y + 1;
norm = norm([2, 3])
gradient_vec = [2, 3]/norm
quiver(1, 0, gradient_vec(1), gradient_vec(2))
hold on
y_t = -2/3*(x-1);
plot(x, y_t);
hold on
contour(X, Y, f1, 'ShowText','on')
axis equal
axis([-1, 3.5, -1, 3.5])
title('f1')

f2 = X.*X + Y.*Y - X.*Y - 5;
contour(X, Y, f2, 'ShowText','on')
hold on
norm = norm([2, -1])
gradient_vec = [2, -1]/norm
quiver(1, 0, gradient_vec(1), gradient_vec(2))
hold on
y_t = 2*(x-1);
plot(x, y_t);
hold on
axis equal
axis([-1, 3.5, -1, 3.5])
title('f2')

f3 = (X-5).*cos(Y-5) - (Y-5).*sin(X-5);
norm = norm([cos(5)+5*cos(4), -4*sin(5)+sin(4)])
gradient_vec = [cos(5)+5*cos(4), -4*sin(5)+sin(4)]/norm
quiver(1, 0, gradient_vec(1), gradient_vec(2))
hold on
y_t = -(cos(5)+5*cos(4))/(-4*sin(5)+sin(4))*(x-1)
plot(x, y_t);
hold on
contour(X, Y, f3, 'ShowText','on')
axis equal
axis([-1, 3.5, -1, 3.5])
title('f3')

%part(c)
f1 = 2*X + 3*Y + 1
mesh(X, Y, f1)
hold on
approx = 3 + 2*(X-1) + 3*Y
mesh(X, Y, approx)
hold on
title('f1')

f2 = X.*X + Y.*Y - X.*Y - 5
mesh(X, Y, f2)
hold on
approx = -4 + 2*(X-1) - 1*Y
mesh(X, Y, approx)
hold on
title('f2')

f3 = (X-5).*cos(Y-5) - (Y-5).*sin(X-5)
mesh(X, Y, f3)
hold on
approx = -4*cos(-5) - (-5)*sin(-4) + (cos(5)+5*cos(4))*(X-1) + (-4*sin(5)+sin(4))*Y
mesh(X, Y, approx)
hold on
title('f3')








