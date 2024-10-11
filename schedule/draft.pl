% Ensure teams do not play against each other at the same time
:- scheduled(T1, T2, Slot), scheduled(T2, T1, Slot).



% Define home availability for team1
home_availability(team1, 1).
home_availability(team1, 2).
home_availability(team1, 3).

% Define home availability for team2
home_availability(team2, 1).
home_availability(team2, 2).
home_availability(team2, 3).

% Define home availability for team3
home_availability(team3, 1).
home_availability(team3, 2).
home_availability(team3, 3).

% Define away availability for team1
away_availability(team1, 1).
away_availability(team1, 2).
away_availability(team1, 3).

% Define away availability for team2
away_availability(team2, 1).
away_availability(team2, 2).
away_availability(team2, 3).

% Define away availability for team3
away_availability(team3, 1).
away_availability(team3, 2).
away_availability(team3, 3).
team(1..n).
slot(1..k).



% Generate schedule
1 {scheduled(T1, T2, Slot) : home_availability(T1, Slot), away_availability(T2, Slot)} 1 :- 
    home_availability(T1, Slot), away_availability(T2, Slot), not forbidden(T1, Slot), not forbidden(T2, Slot), T1 != T2.

% Ensure each team plays only once with another team
:- scheduled(T1, T2, Slot), scheduled(T1, T2_2, Slot), T2 != T2_2.

% Ensure each team plays only one game in a game time slot
:- scheduled(T1, _, Slot), scheduled(T1, _, Slot_2), Slot != Slot_2.

% Ensure teams do not play against each other at the same time
:- scheduled(T1, T2, Slot), scheduled(T2, T1, Slot).

% Display the schedule
#show scheduled/3.





% Display the schedule
#show scheduled/3.




% Ensure each team plays only one game in a game time slot
:- scheduled(T1, _, Slot), scheduled(T1, _, Slot_2), Slot != Slot_2.