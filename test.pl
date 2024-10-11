team(1..n).
slot(1..k).


% Constraint 2 : home team availability H i (i ∈ T ) is respected,
% Constraint 3 : away team unavailability A i (i ∈ T ) is respected,
1 {scheduled(T1, T2, Slot) : home_availability(Slot, T1), away_availability(Slot, T2)} 1 :- 
    home_availability(Slot, T1), away_availability(Slot, T2),not forbidden(Slot, T1), not forbidden(Slot, T2),team(T1), team(T2),slot(Slot), T1 != T2.


% Constraint 1 : Each team plays a home game against each other team at most once.
:- scheduled(T1, T2, Slot1), scheduled(T1, T2_2, Slot2), T2 != T2_2.
:- scheduled(T1, T2, Slot), scheduled(T2, T1, Slot).


% Constraint 4: Ensure each team plays only one game in a game time slot
:- scheduled(T1, _, Slot), scheduled(T1, _, Slot_2), Slot != Slot_2.

% Constraint 5: Each team plays at most 2 games in a period of R_max time slots
% (Assuming R_max = 4 as mentioned in the article )
:- team(T), slot(S1), slot(S2), slot(S3), slot(S4), S1 != S2, S1 != S3, S1 != S4, S2 != S3, S2 != S4, S3 != S4,
   scheduled(T, _, S1), scheduled(T, _, S2), scheduled(T, _, S3), scheduled(T, _, S4).

% Constraint 6: There are at least m time slots between two games with the same pair of teams
% (Assuming 'm' = 60 as mentioned in the article )
:- scheduled(T1, T2, Slot1), scheduled(T2, T1, Slot2), Slot1 != Slot2, abs(Slot1 - Slot2) < 60.

#show scheduled/3.


