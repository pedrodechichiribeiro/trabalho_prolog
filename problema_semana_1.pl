/*
Trabalho da semana 1 da disciplina "Programação Lógica e Inteligência Artificial".
Resolve o problema de lógica "Resoluções de Ano Novo" do website Rachacuca 
(https://rachacuca.com.br/logica/problemas/resolucoes-de-ano-novo/)

DESCRIÇÃO:

Cinco amigas saíram para jantar e estão conversando sobre as suas resoluções
de ano novo. A partir das dicas, descubra o nome, idade, cor da bolsa e o 
nome do namorado de cada uma delas, além da resolução que cada uma delas 
deseja conquistar no ano novo.

*/

resolve(S) :-
    S = resolucao(_,_,_,_,_),
	%A moça que quer viajar está ao lado de quem tem 24 anos.
    ao_lado(L,B,S),
    idade(B,"24"),
	%A Clarissa está em algum lugar à esquerda de quem tem 23 anos.
	nome(C, "Clarissa"),
    a_esquerda(C,D,S),
    idade(D,"23"),
    %A Vivian está exatamente à direita da mulher mais velha.
    nome(E, "Vivian"),
    exatamente_a_direita(E,F,S),
    idade(F,"26"),
    %A namorada do Otávio é a mulher mais nova do grupo.
	namora(G,"Otávio"),
    idade(G,"19"),
    %A moça que namora o Daniel está na última posição.
	namora(H1, "Daniel"),
    S = resolucao(_,_,_,_,H1),
    %A Fabiana está em algum lugar entre quem tem 20 anos e quem quer viajar, nessa ordem.
	nome(H, "Fabiana"),
    entre(H,K,L,S),
    idade(K, "20"),
    res_ano(L, "viajar"),
    %Quem namora o Marcelo está ao lado da Vivian.
	namora(M, "Marcelo"),
    ao_lado(M,E,S),
    %A Vivian está em algum lugar à esquerda de quem pretende economizar dinheiro.
	a_esquerda(E,N,S),
    res_ano(N, "economizar"),
    %Quem quer ler mais no ano novo está ao lado da Vivian.
	res_ano(O, "ler"),
    ao_lado(O,E,S),
	%Quem gostaria de emagrecer está na segunda posição.
    res_ano(P, "emagrecer"),
    S = resolucao(_,P,_,_,_),
    %A Thaís está ao lado da mulher que namora o Otávio.
	nome(Q, "Thaís"),
    ao_lado(Q,G,S),
    %A moça de bolsa amarela está exatamente à esquerda da Ana.
	bolsa(J,"amarela"),
    exatamente_a_esquerda(J,R,S),
    nome(R,"Ana"),
    %A mulher de 19 anos está ao lado da mulher de bolsa verde.
	ao_lado(G,T,S),
    bolsa(T,"verde"),
    %Quem tem a bolsa branca está em algum lugar entre a moça de 20 anos e a de 26 anos, nessa ordem.
	bolsa(U, "branca"),
    entre(U,K,F,S),
    %A cor da bolsa da Ana é vermelha.
	bolsa(R, "vermelha"),
    %A Thaís está ao lado da Fabiana.
	ao_lado(Q,H,S),
    %A mulher de 26 anos está exatamente à esquerda da mulher que namora o Alexandre.
	exatamente_a_esquerda(F,V,S),
    namora(V,"Alexandre"),
    %A mulher de bolsa verde está em algum lugar à direita da Thaís.
	a_direita(T,Q,S).
    
    
nome(mulher(A,_,_,_,_),A).
bolsa(mulher(_,B,_,_,_),B).
res_ano(mulher(_,_,C,_,_),C).
namora(mulher(_,_,_,D,_),D).
idade(mulher(_,_,_,_,E),E).

exatamente_a_direita(X,Y,resolucao(Y,X,_,_,_)).
exatamente_a_direita(X,Y,resolucao(_,Y,X,_,_)).
exatamente_a_direita(X,Y,resolucao(_,_,Y,X,_)).
exatamente_a_direita(X,Y,resolucao(_,_,_,Y,X)).

exatamente_a_esquerda(X,Y,S) :-
    exatamente_a_direita(Y,X,S).

ao_lado(X,Y,S) :-
    exatamente_a_direita(X,Y,S);
    exatamente_a_esquerda(X,Y,S).

entre(A,B,C,resolucao(B,A,C,_,_)).
entre(A,B,C,resolucao(B,A,_,C,_)).
entre(A,B,C,resolucao(B,_,A,C,_)).
entre(A,B,C,resolucao(B,A,_,_,C)).
entre(A,B,C,resolucao(B,_,A,_,C)).
entre(A,B,C,resolucao(B,_,_,A,C)).
entre(A,B,C,resolucao(_,B,A,C,_)).
entre(A,B,C,resolucao(_,B,A,_,C)).
entre(A,B,C,resolucao(_,B,_,A,C)).
entre(A,B,C,resolucao(_,_,B,A,C)).

a_esquerda(B,A,resolucao(B,A,_,_,_)).
a_esquerda(B,A,resolucao(B,_,A,_,_)).
a_esquerda(B,A,resolucao(B,_,_,A,_)).
a_esquerda(B,A,resolucao(B,_,_,_,A)).
a_esquerda(B,A,resolucao(_,B,A,_,_)).
a_esquerda(B,A,resolucao(_,B,_,A,_)).
a_esquerda(B,A,resolucao(_,B,_,_,A)).
a_esquerda(B,A,resolucao(_,_,B,A,_)).
a_esquerda(B,A,resolucao(_,_,B,_,A)).
a_esquerda(B,A,resolucao(_,_,_,B,A)).

a_direita(A,B,S) :-
    a_esquerda(B,A,S).
