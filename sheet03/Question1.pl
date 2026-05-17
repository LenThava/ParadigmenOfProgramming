:- initialization(main).

% factorial(N, F): F = N!
factorial(0, 1).
factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

% euclidean algorithm for gcd
% gcd(A,B,G) = gcd(A,B)
gcd(A,0,A) :- A > 0.
gcd(A,B,G) :-
    B > 0,
    R is A mod B,
    gcd(B,R,G).
% return true if X is in list by taking first el comparing it to X and if not X take Tail and call func again.
is_member(X, [X|_]).
is_member(X, [_|T]) :-
    is_member(X,T).

append_list([], L, L).
append_list([H|T], L, [H|R]) :-
    append_list(T,L,R).

is_sorted([]).
is_sorted([_]).
is_sorted([A,B|T]) :-
% <= is not valid....  ;(
    A =< B,
    is_sorted([B|T]).

main :-
    factorial(5, X),
    write('factorial(5) = '), write(X), nl,

    gcd(12, 8, G),
    write('gcd(12,8) = '), write(G), nl,

    (is_member(3, [1,2,3,4]) -> write('member test: true') ; write('false')), nl,

    append_list([1,2], [3,4], L),
    write('append: '), write(L), nl,

    (is_sorted([1,3,5,7]) -> write('sorted: true') ; write('false')), nl.


% run with : swipl Question1.pl