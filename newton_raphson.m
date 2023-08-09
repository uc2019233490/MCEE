function [root, iter] = newton_raphson(f, x1, tol)

% Converte a função anónima em expressão simbólica, calcula a derivada, e
% converte o resultado numa nova função anónima

y = sym(f);
df = matlabFunction(diff(y));

count = 0;
kmax = 100;


% Representar função que se está a trabalhar
try
    x_visual = fzero(f,x1-1,x1+1);
    if x_visual < x1
        x_plot = linspace(floor(x_visual-abs((x1-x_visual))/4), ceil(x1+abs((x1-x_visual))/4),1000);
    else
        x_plot = linspace(floor(x1-abs((x1-x_visual))/4), ceil(x_visual+abs((x1-x_visual))/4),1000);
    end
catch
    if x1 < 0
        x_plot = linspace(floor(x1-2),ceil(x1+3*x1),1000);
    else
        x_plot = linspace(floor(x1-3*x1),ceil(x1+2),1000);
    end
end

str = regexprep(func2str(f),'^@\([^\)]\)\s*',''); %remover o @(x)
figure("Name","Método Newton-Raphson");
plot(x_plot,f(x_plot),'k');
title(sprintf('f(x) = %s', str));
xlabel('x');ylabel('f(x)'); hold on; grid on;
plot(x_plot,zeros(1,length(x_plot)),'k:');

% Representar ponto inicial
plot(x1,0,'r*','MarkerSize',3);
plot(x1,f(x1),'r*','MarkerSize',3);
plot(x1.*ones(1,3),[0 f(x1/2) f(x1)],'k:');

for n=1:kmax
    if df(x1) == 0
        fprintf('\nERRO! x0 é mín/máx local\n');
        root = NaN;
        iter = 0;
        return;
    end
    count = count +1;
    
    % 2 frames por segundo
    pause(0.5);
    x2 = x1 - f(x1)/df(x1);
    if x1>x2
        plot([x1-(x2-x1)/2 x1 x1+(x2-x1)/2 x2 x2+(x2-x1)/2],[f(x1)+f(x1)/2 f(x1) f(x1)/2 0 -f(x1)/2],'b--');
    else
        plot([x2-(x1-x2)/2 x2 x2+(x1-x2)/2 x1 x1+(x1-x2)/2],[f(x2)+f(x2)/2 f(x2) f(x2)/2 0 -f(x2)/2],'b--');
    end
    
    pause(0.5);
    
    plot(x2,0,'r*','MarkerSize',3);
    plot(x2,f(x2),'r*','MarkerSize',3);
    plot(x2.*ones(1,3),[0 f(x2/2) f(x2)],'k:');
    
    iter = count;
    
    if abs(x2 - x1) < tol
        root = x2;
        return
    else
        x1 = x2;
    end
end
end
