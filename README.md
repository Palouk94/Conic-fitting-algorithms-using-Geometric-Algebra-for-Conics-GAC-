# Conic-fitting-algorithms-using-Geometric-Algebra-for-Conics-GAC-

-Algorithm Q fits a general conic Q  
-Algorithm QAL fits an axes-aligned conic Q^al  
-Algorithms Q0, QO-dir & Q0-sym fit an origin-centred conic Q^0  
-Algorithms Q0, QO-dir & Q0-sym fit an axes-aligned origin-centred conic Q^al0  

All the algorithms have the same inputs and outputs:  
Inputs:  
  px, py...row vectors of x or y coordinates of data points, respectively  
Outputs:  
  Q...conic vector in terms of GAC  
  Conic...implicit equation of conic Q  
  obj_function...minimised objective function of the conic fitting problem  

Function "function plot_points_conic_and_objective_function", whose name is self-descriptive, has inputs:  
  px, py...see above  
  Conic...see above  
  obj_function...see above  
  plot_area...area of plot in the form of the vector of boundaries [x_left x_right y_left y_right]  

All the algorithms can be tested on a sample dataset using the file "Test.m"  
