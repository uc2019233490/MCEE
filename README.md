# MCEE
Repositório do Mini-Projeto de Métodos Computacionais para a Engenharia Eletrotécnica 2021/2022

# Objetivos

O programa permite fazer a animação da aplicação de um dos seguintes algoritmos de resolução de equações a uma variável independente: Método das bissecções, Método de Newton-Raphson e Método das secantes.


Para interagir com o utilizador tem um menu inicial que permite selecionar o método numérico a utilizar na resolução da equação, que após selecionado, o utilizador deverá introduzir qual a equação a resolver, e os dados necessários para a resolução da mesma, tendo em conta o método escolhido. Depois de inseridos os dados, o programa deverá gerar um gráfico animado, onde é demonstrada a aplicação do método selecionado.

# MiniProjeto.m


Neste programa encontramos o menu com o qual o utilizador pode interagir.


O programa funciona num loop infinito através de um while(1) no qual está constantemente a imprimir o menu de opções e a pedir ao utilizador que introduza algo na Command Window. Após receber a opção escolhida através de um input, o programa faz um switch, case, otherwise da opção que funciona da seguinte maneira:


• Caso a opção seja ’1’:


Pede ao utilizador a função e os valores necessários para o Método das Bissecções e chama a função bisection2.m.
Para verificar se a função inserida é válida, é usado um try, catch, em que no try a função está certa e por isso, é convertida a string inserida numa função anónima, em caso contrário o catch apresenta uma mensagem de erro e é pedida a função novamente.
Para pedir os valores mínimo e máximo usamos um loop infinito no qual verificamos se as strings introduzidas são números e se o valor mínimo é menor que o máximo, caso nenhum destes se verifique são enviadas mensagens de erro e os valores são solicitados novamente. Recolher o valor da tolerância funciona de maneira idêntica, exceto que também se verifica que a tolerância tem de ser um valor positivo.
Após os valores serem inseridos é chamada a função bisection2.m e depois desta ser executada é apresentado na Command Window o número de iterações e o valor da raiz calculado da solução.

• No caso da opção ser '2':


Solicita ao utilizador a função e os valores necessários para o Método Newton-Raphson e chama a função newton_raphson.m. O pedido da função e dos valores do ponto de partida e da tolerância são semelhantes ao usado no caso em que a opção é '1'. Após os valores serem inseridos, é chamada a função newton_raphson.m e, depois desta ser executada, é apresentado na janela de comandos o número de iterações e o valor da raiz calculada da solução.

• Se a opção for '3':


Solicita ao utilizador a função e os valores necessários para o Método das Secantes e chama a função secantes.m. O pedido da função e dos valores x1, x2 e da tolerância é semelhante ao usado no caso em que a opção é '1'. Após os valores serem inseridos, é chamada a função secantes.m e, depois desta ser executada, é apresentado na janela de comandos o número de iterações e o valor da raiz calculada da solução.

• Se a opção for 's' ou 'S':


Termina o programa que estava em loop infinito, realizando um break do while(1).

• otherwise:


É exibida uma mensagem de erro indicando que a opção inserida é inválida, através de um disp().


# bisection2.m


Esta função permite a utilização do Método das Bissecções. Para isso, recebe como parâmetros a função, o valor mínimo, o valor máximo e a tolerância inseridos pelo utilizador na função MiniProjeto.m. A função retorna o número de iterações e o valor calculado da solução.
Além disso, esta função possibilita a criação da animação do gráfico, representando a função como uma linha contínua, seus zeros como uma linha tracejada, os pontos de máximo e mínimo como asteriscos, e o ponto médio como um marcador verde em um plot().

# newton-raphson.m


Esta função permite utilizar o Método de Newton-Raphson. Para tal, recebe como parâmetros a função, o valor inicial e o valor da tolerância inseridos pelo utilizador na função MiniProjeto.m. A função retorna o número de iterações e o valor calculado da solução.
Esta função também possibilita a geração da animação do gráfico, representando a função como uma linha contínua, os seus zeros como uma linha tracejada, o ponto de partida e o ponto final como asteriscos num plot().


# secantes.m


Esta função permite utilizar o Método das Secantes. Para tal, recebe como parâmetros a função, o valor x1, o valor x2 e o valor da tolerância inseridos pelo utilizador na função MiniProjeto.m. A função retorna o número de iterações e o valor calculado da solução.
Esta função também possibilita gerar a animação do gráfico, representando a função como uma linha contínua, os seus zeros como uma linha tracejada, os pontos x1 e x2 como asteriscos em um plot().


# Autores

- [Matilde](https://www.github.com/uc2019233490) 
- [Manuel](https://www.github.com/ManelADSantos) 


