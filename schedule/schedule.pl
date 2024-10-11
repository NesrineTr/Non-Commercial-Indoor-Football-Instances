team(1..n).
slot(1..k).

% Home game predicate
home_game(T1, T2, Slot) :- 
    home_availability(Slot, T1),
    team(T1), team(T2), T1 != T2,
    slot(Slot).

% Away game predicate
away_game(T1, T2, Slot) :- 
    away_availability(Slot, T1),
    team(T1), team(T2), T1 != T2,
    slot(Slot).

% Forbidden game predicate
forbidden_game(T1, Slot) :- 
    team(T1), forbidden(Slot, T1).

% Home game scheduled predicate
home_game_scheduled(T1, T2) :- 
    home_game(T1, T2, _).


% Home game slot verification
home_game_slot_verified(T1, T2, Slot) :- 
    home_game(T1, _, Slot), home_game_scheduled(T1, T2).

% Away game slot verification
away_game_slot_verified(T1, T2, Slot) :- 
    home_game_slot_verified(T1, _, Slot), away_game(T2, _, Slot).


count_slots(T1, T2, Count) :-
    Count = #count {Slot : away_game_slot_verified(T1, _, Slot)},
    team(T1),
    team(T2),
    home_game_scheduled(T1, T2).

:- away_game_slot_verified(T1, T2, Slot),count_slots(T1, T2, Count) , Count>1.


#show away_game_slot_verified/3.

