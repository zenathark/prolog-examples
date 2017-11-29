% -*- Mode: prolog -*-
nth([], _, _) :- false.
nth([H|_], 0, Ans) :- Ans = H.
nth([_|T], X, Ans) :- X > 0, X1 is X - 1, nth(T, X1, Ans).

random_nth(Choices, Choice) :-
    length(Choices, L),
    Rnth is random(L),
    nth(Choices, Rnth, Choice).

one_of(Choices, Choice) :- random_nth(Choices, Rnd), Choice = [Rnd].

article(X) :- one_of([the, a], X).
noun(X) :- one_of([man, ball, woman, table], X).
verb(X) :- one_of([hit, took, saw, liked], X).


sentence(X) :-
    noun_phrase(Noun),
    verb_phrase(Verb),
    append(Noun, Verb, X).

noun_phrase(X) :-
    article(Article),
    noun(Noun),
    append(Article, Noun, X).

verb_phrase(X) :-
    verb(Verb),
    noun_phrase(Noun),
    append(Verb, Noun, X).
