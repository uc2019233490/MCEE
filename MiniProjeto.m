%Mini-Projeto de MCEE 2021/2022
%Manuel Alberto Dionísio dos Santos
%Matilde Saraiva de Carvalho - 2019233490

%TOKEN GITHUB: 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
clc;
clear;
close all;

fprintf('**********************************************************\n************* Miniprojeto de MCEE 21/22 ****************\n********* Resolução numérica de equações ***************\n**********************************************************\n');

fprintf('***** MENU *****\n[1] Mét das bisecções\n[2] Mét. Newton-Raphson\n[3] Mét. Secantes\n[s] Sair\n');

while(true)
option = input("Escolha uma opção: ", 's');
if (str2double(option) == 1 || str2double(option) == 2 || str2double(option) == 3 || option == 's')
    break
else
    disp("Opção ERRADA!");
end
end

switch option

    case '1'
        disp('***** Método das Bissecções *****');

        eq1 = input('Equação a resolver (p. ex.: ): ', 's');

        dados 

    case '2'
        disp('***** Método das Newton - Raphson *****');
    case '3'
        disp('***** Método das Secantes *****');
    case 's'
        disp('***** SAIR *****');
end