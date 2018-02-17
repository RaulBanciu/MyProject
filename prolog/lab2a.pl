% Write a predicate to compute the union of two sets
% union(L-int,K-int,R-int)
% union(i,i,o)

find_el([],0).
find_el([X|_],X).
find_el([H|T],X):-
    H=\=X,
    find_el(T,X).

 union([],[],[]).

 union([H|T],K,[H|R]):-
    union(T,K,R).

 union([],[H|T],[H|R]):-
    union([],T,R).

del_ap([H|T],Tr):-
    del_ap(T,Tr),
    find_el(Tr,H).

del_ap([H|T],[H|Tr]):-
    del_ap(T,Tr),
    not(find_el(Tr,H)).

del_ap([],[]).

solve([H1|T1],[H2|T2],[Hr|Tr]):-
    union([H1|T1],[H2|T2],[HR|TR]),
    del_ap([HR|TR],[Hr|Tr]).

