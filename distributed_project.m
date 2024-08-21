clear;
clc;

N = 4; %no of agents
n = 2; %2-input, 2-output

%Double Integrator System
A = [0 1;0 0];
B = [1 0;0 1];
C = [1 0;0 1];
D = [0 0;0 0];
Z = [2 0 1];

A_bar = kron(eye(N), A);
B_bar = kron(eye(N), B);
C_bar = kron(eye(N), C);
D_bar = kron(eye(N), D);

L = [3 -1 -1 -1;
     -1 3 -1 -1;
     -1 -1 3 -1;
     -1 -1 -1 3;];

L_bar = kron(L,eye(n));

h = [2; 0]; %formation vector
%h_bar = kron(ones(N,1),h);
h_bar = [2;4;2;4;2;4;2;4;];


%defining LQR variables
Q = eye(n);
R = 1;
E = eye(n);

%solving ARE
[P, K, eig_acl] = icare(A,B,Q,R,0,E,0);
gamma_cap = P*B*inv(R)*B'*P
P
K
eig_acl
L_bar
Z
K_bar = kron(eye(N), K);
Gamma_cap_bar = kron(eye(N), gamma_cap);
P_bar = kron(eye(N), P);

M1 = [1 0 0 0 0 0 0 0;
      0 1 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;];
M2 = [0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 1 0 0 0 0 0;
      0 0 0 1 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;];
M3 = [0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 1 0 0 0;
      0 0 0 0 0 1 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;];
M4 = [0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 1 0;
      0 0 0 0 0 0 0 1;];



temp= [1;2;3;4;];

K_bar