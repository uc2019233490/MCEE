function [root, iter] = secantes(f, x1, x2, tol)

kmax = 100;  % n.° máx de iterações (pode ser alterado)
count = 0;

% Representar função que se está a trabalhar
x_plot = linspace(-abs(2*x1),abs(2*x2),1000);

str = regexprep(func2str(f),'^@\([^\)]\)\s*',''); % remover o @(x)
figure("Name","Método das Secantes");
plot(x_plot,f(x_plot),'k');
title(sprintf('f(x) = %s', str));
xlabel('x');ylabel('f(x)');hold on; grid on;
plot(x_plot,zeros(1,length(x_plot)),'k:');

plot(x1,f(x1),'b*','MarkerSize',6);
plot(x2,f(x2),'b*','MarkerSize',6);

% Inicializar valores
secante = plot(0,0);
root_0 = plot(0,0);
root_valor = plot(0,0);
x3 = x2;

for n = 2:kmax
    pause(1);
    delete(secante);
    delete(root_0);
    delete(root_valor);
    plot(x3,0,'m.','MarkerSize',3);
    plot(x3,f(x3),'m.','MarkerSize',3);
    count = count +1;
    
    x3 = x2 - ((x2 - x1) /(f(x2) - f(x1))) * f(x2);
    root_0 = plot(x3,0,'r*','MarkerSize',4);
    root_valor = plot(x3,f(x3),'g*','MarkerSize',4);
    plot(x3.*ones(1,3),[0 f(x3/2) f(x3)],'k:');
    secante = plot([x2 x2+(x3-x2)/2 x3],[f(x2) f(x2)/2 0],'b--');

    if abs(x3 - x2) < tol
        root = x2;
        iter = count;
        return
    else
        x1 = x2;
        x2 = x3;
    end
end
end
