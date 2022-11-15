#language: pt

@vigilante
Funcionalidade: Monitorar o Site de Análise
Acessar o Site de Análises
Em Busca de Partidas
Previsão Mais de 5 Gols

Cenário: Monitorar Partidas Com Mais de 5 Gols
Dado que estou logado no Site de Análises
E que abro os "<primeiraAba>" em uma nova aba
E que abro os "<segundaAba>" em  uma nova aba
Quando monitoro os Gols de cada Partida
Então envio os Dados Coletados

Exemplos:

|liga|primeiraAba|segundaAba|terceiraAba|quartaAba|
|euro|Próx. Jogos|Horários  |           |         |