f1 = @(x) sin(x);

syms x

f = sin(x);

m_A = [
    1 2 3;
    2 3 4;
    3 4 5;
];

disp(rref(m_A))

disp(inv(m_A))

disp(m_A\(m_A))

