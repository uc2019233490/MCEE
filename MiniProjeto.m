% /==========/ Mini-Projeto de MCEE 2021/2022 /==========/
% Manuel Alberto Dionísio dos Santos - 2019231352
% Matilde Saraiva de Carvalho - 2019233490

clc;
clear;
close all;

syms x;

while(1)
    fprintf('\n\n**********************************************************\n************** Miniprojeto de MCEE 21/22 *****************\n********** Resolução numérica de equações ****************\n**********************************************************\n');
    fprintf('***** MENU *****\n[1] Mét. das bisecções\n[2] Mét. Newton-Raphson\n[3] Mét. Secantes\n[s] Sair\n');
    option = input("Escolha uma opção: ", 's');
    
    switch option
        % /==========/ Método das Bissecções /==========/
        case '1'
            clear;
            close all;
            fprintf('\n***** Método das Bissecções *****\n');
            
            % Recolher equação a analisar
            eq1 = input('Equação a resolver (p. ex.: x.^2 + 2.*x): ', 's');
            try
                eq = str2func(['@(x)',eq1]);
                eq(0);
            catch
                disp('ERRO! Expressão da equação inválida');
                continue;
            end
            
            while(1)
                % Recolher valor do mínimo
                min = input('Valor mínimo: ','s');
                min = str2double(min);
                if(isnan(min))
                    disp('ERRO! É necessário que mínimo seja um valor numérico');
                    continue;
                end
                
                % Recolher valor do máximo
                max = input('Valor máximo: ','s');
                max = str2double(max);
                if(isnan(max))
                    disp('ERRO! É necessário que máximo seja um valor numérico');
                    continue;
                end
                
                % Verificar se valores fazem sentido
                if(max > min)
                    break;
                else
                    disp('ERRO! É necessário que máximo > mínimo');
                end
            end
            
            % Recolher valor da tolerância
            while(1)
                tol = input('Valor da tolerância: ','s');
                tol = str2double(tol);
                if(isnan(tol) || tol <= 0)
                    disp('ERRO! É necessário que a tolerância seja um valor numérico positivo');
                    continue;
                end
                break;
            end
            
            [f, iter] = bisection2(eq, min, max, tol);
            fprintf("Raíz --> x = %g\nNúmero de iterações: %d", f, iter);
            
            % /==========/ Método das Newton - Raphson /==========/
        case '2'
            clear;
            close all;
            fprintf('\n***** Método das Newton - Raphson *****\n');
            
            % Recolher equação a analisar
            eq2 = input('Equação a resolver (p. ex.: x.^2 + 2.*x): ', 's');
            try
                eq = str2func(['@(x)',eq2]);
                eq(0);
            catch
                disp('ERRO! Expressão da equação inválida');
                continue;
            end
            
            while(1)
                % Recolher ponto de partida
                x0 = input('Valor de partida x0: ','s');
                x0 = str2double(x0);
                if(isnan(x0))
                    disp('ERRO! É necessário que x0 seja um valor numérico');
                    continue;
                end
                break;
            end
            
            % Recolher valor da tolerância
            while(1)
                tol = input('Valor da tolerância: ','s');
                tol = str2double(tol);
                if(isnan(tol) || tol <= 0)
                    disp('ERRO! É necessário que a tolerância seja um valor numérico positivo');
                    continue;
                end
                break;
            end
            
            [f, iter] = newton_raphson(eq, x0, tol);
            fprintf("Raíz --> x = %g\nNúmero de iterações: %d", f, iter);
            
            
            % /==========/ Método das Secantes /==========/
        case '3'
            clear;
            close all;
            fprintf('\n***** Método das Secantes *****\n');
            % Recolher equação a analisar
            eq3 = input('Equação a resolver (p. ex.: x.^2 + 2.*x): ', 's');
            try
                eq = str2func(['@(x)',eq3]);
                eq(0);
            catch
                disp('ERRO! Expressão da equação inválida');
                continue;
            end
            
            while(1)
                % Recolher x1
                x1 = input('Valor de x1: ','s');
                x1 = str2double(x1);
                if(isnan(x1))
                    disp('ERRO! É necessário que x1 seja um valor numérico');
                    continue;
                end
                
                % Recolher x2
                x2 = input('Valor de x2: ','s');
                x2 = str2double(x2);
                if(isnan(x2))
                    disp('ERRO! É necessário que x2 seja um valor numérico');
                    continue;
                end
                
                % Verificar se valores fazem sentido
                if(x1 ~= x2 || x1 < x2)
                    break;
                else
                    disp('ERRO! x1 tem de ser diferente e menor do que x2');
                end
            end
            
            % Recolher valor da tolerância
            while(1)
                tol = input('Valor da tolerância: ','s');
                tol = str2double(tol);
                if(isnan(tol) || tol <= 0)
                    disp('ERRO! É necessário que a tolerância seja um valor numérico positivo');
                    continue;
                end
                break;
            end
            [f, iter] = secantes(eq, x1, x2, tol);
            fprintf("Raíz --> x = %g\nNúmero de iterações: %d", f, iter);
            
            % /==========/ Sair do programa /==========/
        case {'s','S'}
            clear;
            close all;
            disp('***** SAIR *****');
            break;
            
            % /==========/ Opção inválida /==========/
        otherwise
            disp("Opção inválida!");
    end
end
