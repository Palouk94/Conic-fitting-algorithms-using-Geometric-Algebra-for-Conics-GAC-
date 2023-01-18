close all

%% Testing dataset
px = [-3 -3 -2 -3 -6 -7 -9 -10 -9 -7];
py = [3 4 6 7 8 8 7 4 2 1];

%% Area of plot ( [x_left x_right y_left y_right] )
plot_area = [-12 12 -10 15];

%% General conic Q
[Q, Conic, obj_function] = Algorithm_Q(px,py);
plot_points_conic_and_objective_function(px, py, Conic, obj_function, plot_area)

%% Axes-aligned conic Q^al
[Q, Conic, obj_function] = Algorithm_QAL(px,py);
plot_points_conic_and_objective_function(px, py, Conic, obj_function, plot_area)

%% Origin-centred conic Q^0
[Q, Conic, obj_function] = Algorithm_Q0(px,py);
plot_points_conic_and_objective_function(px, py, Conic, obj_function, plot_area)

[Q, Conic, obj_function] = Algorithm_Q0_dir(px,py);
plot_points_conic_and_objective_function(px, py, Conic, obj_function, plot_area)

[Q, Conic, obj_function] = Algorithm_Q0_sym(px,py);
plot_points_conic_and_objective_function(px, py, Conic, obj_function, plot_area)

%% Axes-aligned origin-centred conic Q^AL0
[Q, Conic, obj_function] = Algorithm_QAL0(px,py);
plot_points_conic_and_objective_function(px, py, Conic, obj_function, plot_area)

[Q, Conic, obj_function] = Algorithm_QAL0_dir(px,py);
plot_points_conic_and_objective_function(px, py, Conic, obj_function, plot_area)

[Q, Conic, obj_function] = Algorithm_QAL0_sym(px,py);
plot_points_conic_and_objective_function(px, py, Conic, obj_function, plot_area)
