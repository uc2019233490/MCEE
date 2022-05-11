function c = bisection2(f, a, b, tol)
    
    if f(a)*f(b) > 0
        error('O intervalo não contém nenhuma raiz');
    end

    %tol = 1e-4; % Define a tolerância (critério de paragem)
    
    for k = 1:kmax
        c = (a+b)/2; % Primeiro ponto médio
        if f(c) == 0 % Para se houver uma raíz
            return
        end
    end

    if (b-a)/2 < tol % Valor abaixo da tolerância
        return
    end
 
    if f(b)*f(c) > 0 % Verifica mudança de sinal
        b = c; % Ajusta o limite do intervalo
    else
        a=c;
    end
end