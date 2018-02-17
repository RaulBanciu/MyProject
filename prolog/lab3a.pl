%4.
% a. Write a predicate to determine the sum of two numbers written in
% list representation.
% b. For a heterogeneous list, formed from integer numbers and list of
% digits, write a predicate to compute the
%sum of all numbers represented as sublists.
%append(L-list,E-int,R-list)
%append(i,i,o)
append([],E,[E]).
append([H|T],E,[H|Tr]):-
    append(T,E,Tr).
%rev(L-list,R-list)
%rev(i,o)
rev([],[]).
rev([H|T],R):-
    rev(T,L),
    append(L,H,R).
%sum(L-list,K-list,E-integer,R-list)%
%sum(i,i,i,o)
sum([],[],0,[]):-!.
sum([],[],E,[E]):-!.
sum([],K,0,K):-!.
sum(L,[],0,L):-!.

sum([],[H|T],CR,[Hr|Tr]):-
    Hr is (H+CR) mod 10,
    NTr is(H+CR) div 10,
    sum([],T,NTr,Tr).


sum(L,[],CR,R):-
    sum([],L,CR,R).

sum([H1|T1],[H2|T2],T,[SUM|Tr]):-
    SUM is(H1+H2+T) mod 10,
    CRN is(H1+H2+T) div 10,
    sum(T1,T2,CRN,Tr).
%doSum(L-list,K-list,R-list)
%doSum(i,i,o)
doSum(L,K,R):-
    rev(L,L1),
    rev(K,K1),
    sum(L1,K1,0,R1),
    rev(R1,R).
%sumHet(L-list,R-list)
%sumHet(i,o)
sumHet([],[]).
sumHet([H|T],R):-
    number(H),
    sumHet(T,R).

sumHet([H|T],R):-
    is_list(H),
    sumHet(T,R1),
    doSum(R1,H,R).


