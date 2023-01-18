function plot_points_conic_and_objective_function(px, py, Conic, obj_function, plot_area)

figure
axis equal
fimplicit(Conic,plot_area)
hold on
scatter(px, py)
hold on
fimplicit(@(x,y) x,plot_area,'k')
hold on
fimplicit(@(x,y) y,plot_area,'k')
hold on
title(['objective function = ',num2str(obj_function)])

end