function [c, iter] = bisection2(f, a, b, tol)

% A função bisection2 recebe a função f, definida como função anónima,
% e os valores a e b, que definem os limites do intervalo onde se encontra
% uma solução de f e a tolerância.

kmax = 100;
count = 0;

% Verificar se os valores são válidos
if f(a)*f(b) > 0
    fprintf('\nERRO! O intervalo não contém nenhuma ou mais do que uma raiz\n');
    c = NaN;
    iter = 0;
    return;
end

% Representar função que se está a trabalhar
% floor e ceil utilizados por motivos visuais

str = regexprep(func2str(f),'^@\([^\)]\)\s*',''); % remover o @(x)

x_plot = linspace(floor(a)-1,ceil(b)+1,1000);
figure("Name","Método das Bissecções")
plot(x_plot,f(x_plot),'k'); 
title(sprintf('f(x) = %s', str));
xlabel('x');ylabel('f(x)');hold on; grid on;
plot(x_plot,zeros(1,length(x_plot)),'k:');

% Representar máximo e mínimo definido
p(1) = plot(a,0,'b*','MarkerSize',6);
p(2) = plot(b,0,'r*','MarkerSize',6);

legend(p([1 2]),"Mínimo","Máximo");

% Primeiro ponto médio
c = (a+b)/2;
p(3) = plot(c,0,'go','MarkerFaceColor','g','MarkerSize',6);

for k = 1:kmax
    delete(p(3));
    p(3) = plot(c,0,'yo','MarkerFaceColor','k','MarkerSize',2);
    
    % Novo ponto médio
    c = (a+b)/2;
    
    p(3) = plot(c,0,'go','MarkerFaceColor','g','MarkerSize',6);
    legend(p([1 2]),"Mínimo","Máximo");
    
    % 2 frames por segundo
    pause(0.5);
    
    count = count +1;
    
    % Caso se tenha encontrado uma raíz ou tolerância correta
    if (f(c) == 0 || (b-a)/2 < tol)
        iter = count;
        legend(p([1 2 3]),"Mínimo","Máximo","Solução");
        return;
    end
    
    % Verificar mudança de sinal e ajustar intervalo de trabalho
    if f(b)*f(c) > 0
        b = c;
    else
        a = c;
    end
end
