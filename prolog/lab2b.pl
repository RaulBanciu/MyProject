solve([],[],_,[]).
solve([H|T],A,E,R1):-
    solve(T,A,E,R),
    R1 = [[E,H]|R].
solve([],A,_,R):-
    A=[H|T],
    solve(T,T,H,R).
solve2([H|T],R):-
    solve(T,T,H,R).


