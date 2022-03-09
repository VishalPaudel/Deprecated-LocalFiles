[J B F R] = data5_5_10a;

njoints = length(J(:,1));   nbars   = length(B(:,1)); 
nloads  = length(F(:,1));   nreacts = length(R(:,1)); 

basex = J(B(:,2),2);    basey = J(B(:,2),3);
tipx  = J(B(:,3),2);    tipy  = J(B(:,3),3);

x  =  tipx - basex;      y  =  tipy - basey;
D  =  sqrt(x.^2 + y.^2);
cx =  x./D;              cy = y./D; % Direction cosines

A  = zeros(2*njoints);   L  = zeros(2*njoints,1);

for i=1:nbars   %once through for each bar
   A(2*B(i,2)-1  , i ) =  cx(i);
   A(2*B(i,2)    , i ) =  cy(i);
   A(2*B(i,3)-1  , i ) = -cx(i);
   A(2*B(i,3)    , i ) = -cy(i);
end

for j = 1:nreacts %once through for each reaction
    A(2*R(j,2)-1, nbars+j ) = R(j,3);
    A(2*R(j,2)  , nbars+j ) = R(j,4);
end

for k = 1:nloads % once through for each load
    L(2*F(k,1)-1) = -F(k,2);
    L(2*F(k,1)  ) = -F(k,3);
end

T=A\L
