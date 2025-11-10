primeiro(X,[X|_]).
segundo(X,[_,X|_]).

comprimento([],0).
comprimento([_ | T],C) :-
    comprimento(T,CT),
    C is CT+1.

somaIneficiente([],0).
somaIneficiente([H | T], S) :-
    somaIneficiente(T,ST),
    S is ST+H.

%é ineficiente por fazer recursão pelo Head da lista
%idealmente é melhor uma recursão pela cauda.
%ainda assim, é funcional e simples para pequenos valores

somaEficiente([],Ac,Ac).
somaEficiente([H|T],Ac,S):-
    NAc is Ac+H,
    somaEficiente(T,NAc,S).

soma_resultado(A,S) :-
    somaEficiente(A,0,S).

%recursivamente percorre a cauda, evitando alocamento
%desnecessário ou overflow.

seleciona(H,[H|T],T).
seleciona(X,[H|T],[H|R]) :-
    seleciona(X,T,R).

%selecionar um dado elemento de um lista
