import random
import math
import numpy as np

from display import render
size = 3

# infinity
INF = float("inf")


def move(grid, row, col, player):
    grid[row][col] = player


def undo(grid, row, col):
    grid[row][col] = 0


def get_user_input(grid):
    while True:
        render(grid)
        print("   ENTER ROW AND COLUMN")
        choice = input("   > ").split()
        try:
            row, col = map(int, choice)
            if row < 0 or row > size:
                continue
            if col < 0 or col > size:
                continue
            if grid[row][col] != 0:
                continue
            return row, col
        except:
            continue


def win_player(grid, char):
    # check if a player wins the game
    # check for rows, columns and diagonals
    result = char * size in grid.sum(axis=1)
    result = result or char * size in grid.sum(axis=0)
    result = result or char * size == np.trace(grid)
    result = result or char * size == np.trace(np.fliplr(grid))
    return result


def terminal(grid):
    # check if the game is at a terminal state
    # a game is a terminal state if either player wins or it's a tie
    return win_player(grid, -1) or win_player(grid, 1) or 0 not in grid


def utility(grid):
    # return the score corresponding to the terminal state
    if win_player(grid, -1):
        return -1
    if win_player(grid, 1):
        return 1
    return 0


def actions(grid):
    # return possible actions a player can take at each state
    result = np.where(grid == 0)
    result = np.transpose(result)
    np.random.shuffle(result)
    return result


def score_function(grid, char):
    score = 0
    for i in range(len(grid)):
        for j in range(len(grid[i]) - 1):
            if grid[i][j] == char and grid[i][j + 1] == char:
                score += 1
    return score

def minimax(grid, depth, alpha, beta, maximizingPlayer):
    # return the maximum value a player can obtain at each step
    if terminal(grid) or depth == 0:
        if terminal(grid):
            if win_player(grid, 1):
                return None, math.inf, depth
            elif win_player(grid, -1):
                return None, -math.inf, depth
            else:
                return None, 0, depth
        else:
            if maximizingPlayer:
                return None, score_function(grid, 1), depth
            else:
                return None, -score_function(grid, -1), depth

    if maximizingPlayer:
        value = -math.inf
        char = 1
        act = random.choice(actions(grid))

        for action in actions(grid):
            row, col = action
            move(grid, row, col, char)
            new_score = minimax(grid, alpha, beta, depth + 1, False)[1]
            # undo the move
            undo(grid, row, col)
            if new_score > value:
                value = new_score
                act = action
        return act, new_score, depth
    
    else:
        value = math.inf
        char = -1
        act = random.choice(actions(grid))
        
        for action in actions(grid):
            row, col = action
            move(grid, row, col, char)
            new_score = minimax(grid, alpha, beta, depth + 1, True)[1]
            # undo the move
            undo(grid, row, col)
            if new_score < value:
                value = new_score
                act = action
        return act, new_score, depth


def game_loop(grid):
    while True:
        # player turn
        row, col = get_user_input(grid)
        move(grid, row, col, -1)
        render(grid)
        # check if the player wins
        if win_player(grid, -1):
            print("   YOU WIN!")
            break
        # check if it's a tie
        if terminal(grid):
            print("   TIE!")
            break
        # computer turn
        action = minimax(grid, 10, -math.inf, math.inf, True)[0]
        row, col = action
        move(grid, row, col, 1)
        render(grid)
        # check if machine wins
        if win_player(grid, 1):
            print("   YOU LOSE!")
            break


def play():
    while True:
        # Initialize empty grid
        grid = np.zeros((size, size), int)
        game_loop(grid)
        print("   PLAY AGAIN ? [Y/N]")
        again = input("   > ")
        if again.upper() != "Y":
            break


if __name__ == "__main__":
    try:
        play()
    except KeyboardInterrupt:
        print("\n   KEYBOARD INTERRUPT : ABORT")
