# Código original de https://github.com/techwithtim
# Modificado por Daniel, Andrés y Vicente para la Ayudantía 5 de IIC2613 2022-1

# Necesario instalar PyGame usando !pip install pygame

import pygame
import math
from queue import PriorityQueue

# Factor K (también llamado w), para implementar Weighted A*
K_WEIGHT = 1

# Número de filas en la grilla (es igual al de columnas)
ROWS = 10

# Ancho de la pantalla (WIDTH x WIDTH)
WIDTH = 800

WIN = pygame.display.set_mode((WIDTH, WIDTH))
pygame.display.set_caption("A* Path Finding Algorithm")

pygame.init()
pygame.key.set_repeat(200, 200)

RED = (255, 100, 100)
GREEN = (100, 255, 100)
BLUE = (0, 255, 0)
YELLOW = (255, 255, 0)
WHITE = (255, 255, 255)
BLACK = (22, 22, 22)
PURPLE = (128, 50, 128)
ORANGE = (255, 165, 100)
GREY = (128, 128, 128)
LIGHT_GREY = (220, 220, 220)
TURQUOISE = (100, 224, 208)

class Spot:
	def __init__(self, row, col, width, total_rows):
		self.row = row
		self.col = col
		self.x = row * width
		self.y = col * width
		self.f = "-"
		self.color = WHITE
		self.neighbors = []
		self.width = width
		self.total_rows = total_rows

	def get_pos(self):
		return self.row, self.col

	def is_closed(self):
		return self.color == LIGHT_GREY

	def is_open(self):
		return self.color == GREEN

	def is_barrier(self):
		return self.color == BLACK

	def is_start(self):
		return self.color == RED

	def is_end(self):
		return self.color == TURQUOISE

	def reset(self):
		self.color = WHITE

	def make_start(self):
		self.color = RED

	def make_closed(self):
		self.color = LIGHT_GREY

	def make_open(self):
		self.color = GREEN

	def make_expanding(self):
		self.color = YELLOW

	def make_barrier(self):
		self.color = BLACK

	def make_end(self):
		self.color = TURQUOISE

	def make_path(self):
		self.color = PURPLE

	def draw(self, win):
		pygame.draw.rect(win, self.color, (self.x, self.y, self.width, self.width))

		if self.is_open():
			font_size = int(120/ROWS) if int(120/ROWS) > 12 else 12
			font = pygame.font.SysFont('Arial', font_size, bold = True)
			WIN.blit(font.render(str(self.f), True, (0,0,0)), (int(self.x + 5), int(self.y + 5)))

	def update_neighbors(self, grid):
		self.neighbors = []
		if self.row < self.total_rows - 1 and not grid[self.row + 1][self.col].is_barrier(): # DOWN
			self.neighbors.append(grid[self.row + 1][self.col])

		if self.row > 0 and not grid[self.row - 1][self.col].is_barrier(): # UP
			self.neighbors.append(grid[self.row - 1][self.col])

		if self.col < self.total_rows - 1 and not grid[self.row][self.col + 1].is_barrier(): # RIGHT
			self.neighbors.append(grid[self.row][self.col + 1])

		if self.col > 0 and not grid[self.row][self.col - 1].is_barrier(): # LEFT
			self.neighbors.append(grid[self.row][self.col - 1])

	def __lt__(self, other):
		return False


def h(p1, p2):
	x1, y1 = p1
	x2, y2 = p2
	return abs(x1 - x2) + abs(y1 - y2)


def reconstruct_path(came_from, current, draw):
	while current in came_from:
		current = came_from[current]
		current.make_path()
		draw()

def construct_path(came_from, current, draw):
	draw()
	offset = WIDTH/(2 * current.total_rows)
	while current in came_from:
		pygame.draw.line(WIN, (0,0,0), (current.x + offset, current.y + offset), (came_from[current].x + offset, came_from[current].y + offset), int(offset/4))
		current = came_from[current]
	pygame.display.flip()


def algorithm(draw, grid, start, end):
	global K_WEIGHT

	count = 0
	open_set = PriorityQueue()
	open_set.put((0, count, start))
	came_from = {}
	g_score = {spot: float("inf") for row in grid for spot in row}
	g_score[start] = 0
	f_score = {spot: float("inf") for row in grid for spot in row}
	f_score[start] = h(start.get_pos(), end.get_pos())

	open_set_hash = {start}

	while not open_set.empty():
		for event in pygame.event.get():
			if event.type == pygame.QUIT:
				pygame.quit()

		current = open_set.get()[2]
		open_set_hash.remove(current)

		if current == end:
			reconstruct_path(came_from, end, draw)
			end.make_end()
			return True

		if current != start:
			current.color = ORANGE

		for neighbor in current.neighbors:
			temp_g_score = g_score[current] + 1

			if temp_g_score < g_score[neighbor]:
				came_from[neighbor] = current
				g_score[neighbor] = temp_g_score
				f_score[neighbor] = temp_g_score + K_WEIGHT * h(neighbor.get_pos(), end.get_pos())
				if neighbor not in open_set_hash:
					count += 1
					open_set.put((f_score[neighbor], count, neighbor))
					open_set_hash.add(neighbor)

					neighbor.make_expanding()
					neighbor.f = int(f_score[neighbor] * 100)/100
					print(f"Sacando el f para el nodo ({neighbor.row}, {neighbor.col}): {f_score[neighbor]}")
					draw()

					construct_path(came_from, current, draw)

					jump = False
					while not jump:
						for event in pygame.event.get():
							if event.type == pygame.KEYDOWN and event.key == pygame.K_RIGHT:
								jump = True

					neighbor.make_open()

		# draw()

		if current != start:
			current.make_closed()
			draw()
			
			jump = False
			while not jump:
				for event in pygame.event.get():
					if event.type == pygame.KEYDOWN and event.key == pygame.K_RIGHT:
						jump = True

	return False


def make_grid(rows, width):
	grid = []
	gap = width // rows
	for i in range(rows):
		grid.append([])
		for j in range(rows):
			spot = Spot(i, j, gap, rows)
			grid[i].append(spot)

	return grid


def draw_grid(win, rows, width):
	gap = width // rows
	for i in range(rows):
		pygame.draw.line(win, GREY, (0, i * gap), (width, i * gap))
		for j in range(rows):
			pygame.draw.line(win, GREY, (j * gap, 0), (j * gap, width))


def draw(win, grid, rows, width):
	win.fill(WHITE)

	for row in grid:
		for spot in row:
			spot.draw(win)

	draw_grid(win, rows, width)
	pygame.display.update()


def get_clicked_pos(pos, rows, width):
	gap = width // rows
	y, x = pos

	row = y // gap
	col = x // gap

	return row, col


def main(win, width):
	grid = make_grid(ROWS, width)

	start = None
	end = None

	run = True
	while run:
		draw(win, grid, ROWS, width)
		for event in pygame.event.get():
			if event.type == pygame.QUIT:
				run = False

			if pygame.mouse.get_pressed()[0]: # LEFT
				pos = pygame.mouse.get_pos()
				row, col = get_clicked_pos(pos, ROWS, width)
				spot = grid[row][col]
				if not start and spot != end:
					start = spot
					start.make_start()

				elif not end and spot != start:
					end = spot
					end.make_end()

				elif spot != end and spot != start:
					spot.make_barrier()

			elif pygame.mouse.get_pressed()[2]: # RIGHT
				pos = pygame.mouse.get_pos()
				row, col = get_clicked_pos(pos, ROWS, width)
				spot = grid[row][col]
				spot.reset()
				if spot == start:
					start = None
				elif spot == end:
					end = None

			if event.type == pygame.KEYDOWN:
				if event.key == pygame.K_SPACE and start and end:
					for row in grid:
						for spot in row:
							spot.update_neighbors(grid)

					algorithm(lambda: draw(win, grid, ROWS, width), grid, start, end)

				if event.key == pygame.K_c:
					start = None
					end = None
					grid = make_grid(ROWS, width)

	pygame.quit()

main(WIN, WIDTH)