function r = newton_raphson(f, x1, tol)
% Converte a função anónima em expressão simbólica, calcula a derivada, e
% converte o resultado numa nova função anónima
    y = sym(f);
    fp = matlabFunction(diff(y));
    %tol = 1e-4;  % tolerância
    for n=1:N
        if fp(x1) == 0
            error('x1 é mín/máx local');
        end
        x2 = x1 - f(x1)/fp(x1);
        if abs(x2 - x1) < tol 
            r = x2;
            return 
        else
        x1 = x2;
        end
    end
end