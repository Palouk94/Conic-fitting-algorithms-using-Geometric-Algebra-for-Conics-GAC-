function [Q, Conic, obj_function] = Algorithm_QAL0_sym(px,py) 

p = [px;py];
N = length(px);

p = [p,-p];
p = [p, [p(1,:); -p(2,:)]];
N = 4*N;

B = zeros(6);
I3 = [0 0 1;0 1 0; 1 0 0];
B(1:3,4:6) = -I3;
B(4:5,2:3) = eye(2);
B(6,1) = -1;	
Bc = B(3:6,1:4);

D = ones(6,N);
D(2:3,:) = p;
D(4,:) = 1/2*(p(1,:).^2+p(2,:).^2);
D(5,:) = 1/2*(p(1,:).^2-p(2,:).^2);
D(6,:) = p(1,:).*p(2,:);

P = 1/N*B*(D*D')*B';
Pc = P(3:6,3:6);
P0 = P(1:2,1:2);
P1 = P(1:2,3:6);

Pcon = Bc*(Pc-P1'*(P0\P1));
[EV,ED] = eig(Pcon);
EW = diag(ED);

k_opt = find(EW == min(EW(EW>0)));
v_opt = EV(:,k_opt);

kappa = v_opt'*Bc*v_opt;
v_opt = 1/sqrt(kappa)*v_opt;

w = -P0\P1*v_opt;
Q = [w;v_opt;0;0];

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

