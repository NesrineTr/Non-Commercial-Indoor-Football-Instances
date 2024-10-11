team(1..n).

slot(1..k).

home_game(T1, T2, Slot) :- home_availability(Slot, T1), team(T1), team(T2), T1 != T2, slot(Slot).

away_game(T1, T2, Slot) :- away_availability(Slot, T1), team(T1), team(T2), T1 != T2, slot(Slot).

% Contrainte : les équipes ne doivent pas avoir de match interdit à lheure spécifiée
forbidden_game(T1, Slot) :-  team(T1), forbidden(Slot, T1).


% Define a predicate to check if a home game between Team1 and Team2 has been scheduled
home_game_scheduled(Team1, Team2) :-
    home_game(Team1, Team2, _).
home_game_scheduled(Team1, Team2) :-
    home_game(Team2, Team1, _).

% Define a predicate to ensure that each pair of teams plays at most one home game
at_most_one_home_game :-
    team(Team1),
    team(Team2),
    dif(Team1, Team2), % Ensure Team1 and Team2 are different
    home_game_scheduled(Team1, Team2),
    home_game_scheduled(Team2, Team1).

% Call the predicate to enforce the constraint
:- at_most_one_home_game.


% time slot verifé
home_game_slot_verified(T1,T2,Slot) :- home_game(T1,_,Slot), home_game_scheduled(T1,T2).


away_game_slot_verified(T1,T2,Slot) :- home_game_slot_verified(T1,_,Slot) , away_game(T2, _, Slot).

