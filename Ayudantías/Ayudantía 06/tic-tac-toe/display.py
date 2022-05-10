import os

size = 3

GUIDE = """
   TIC-TAC-TOE WITH AI -- HUMAN VS MACHINE
    
   HUMAN : X
   MACHINE : O
"""

CLEAR = "clear" if os.name == "posix" else "cls"


def left(i, size):
    if i == 0:
        return "┌"
    elif i == size:
        return "└"
    else:
        return "├"


def right(i, size):
    if i == 0:
        return "┐"
    elif i == size:
        return "┘"
    else:
        return "┤"


def mid(i, size):
    if i == 0:
        return "┬"
    elif i == size:
        return "┴"
    else:
        return "┼"


def separator(i, size):
    ans = left(i, size)
    ans += mid(i, size).join(["───" for _ in range(size)])
    ans += right(i, size)
    return ans


def _print_cols(grid, i):
    print(f" {i} │ ", end="")
    for j in range(size):
        value = grid[i, j]
        char = [" ", "O", "X"][value]
        print(char + " │ ", end="")


def _print_lines(grid):
    print("\n   " + separator(0, size))
    for i in range(size):
        _print_cols(grid, i)
        print("\n   " + separator(i + 1, size))


def render(grid):
    # clear the screen to print at the same place
    os.system(CLEAR)
    print(GUIDE)
    print("     ", end="")
    for col in range(size):
        print(col, end="   ")
    _print_lines(grid)
    print()
