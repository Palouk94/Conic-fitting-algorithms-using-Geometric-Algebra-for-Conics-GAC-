function [Q, Conic, obj_function] = Algorithm_QAL0_dir(px,py) 

p = [px;py];
N = length(px);

B = [0  0 -1; 0 -1  0; -1  0  0];
Bc = B(2:3,1:2);

D = ones(3,N);
D(2,:) = 1/2*(p(1,:).^2+p(2,:).^2);
D(3,:) = 1/2*(p(1,:).^2-p(2,:).^2);

P = 1/N*B*(D*D')*B';
Pc = P(2:3,2:3);
P0 = P(1,1);
P1 = P(1,2:3);

Pcon = Bc*(Pc-P1'*1/P0*P1);
p = Pcon(1,2);
q = Pcon(2,1);

vpb = (p/(4*q))^0.25;  
vp = -1/(2*vpb);                      
v_opt = [vpb;vp];

w = -P0\P1*v_opt;
Q = [0;w;vpb;0;0;vp;0;0];
Qr = [w;v_opt];

q11 = -1/2*(Q(3) + Q(2));
q22 = -1/2*(Q(3) - Q(2));
q33 = -Q(6);
q12 = -1/2*Q(1);
q13 = 1/2*Q(4);
q23 = 1/2*Q(5);

Conic = @(x,y) q11*x^2 + 2*q12*x*y + q22*y^2 + 2*q13*x + 2*q23*y + q33;
obj_function = Qr'*P*Qr;

end

