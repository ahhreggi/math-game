# 2-Player Math Game

## Description
- Two players take turns to answer simple math addition problems.
- A new math question is generated for each turn by picking two numbers between 1 and 20.
- The player whose turn it is is prompted the question and must answer correctly or lose a life.

## Details
- Both players start with 3 lives and lose a life if they answer a question incorrectly.
- The game should output the new scores for both players at the end of every turn.
- The game ends once one of the players loses all of their lives.
- The winner is announced and scores are displayed.

## Example prompt:
```
Player 1: What does 5 plus 3 equal?
> 9
Player 1: Seriously? No!
P1: 2/3 vs P2: 3/3
----- NEW TURN -----
Player 2: What does 2 plus 6 equal?
> 8
Player 2: YES! You are correct.
P1: 2/3 vs P2: 3/3
----- NEW TURN -----
... some time later ...
Player 1 wins with a score of 1/3
----- GAME OVER -----
Good bye!
```