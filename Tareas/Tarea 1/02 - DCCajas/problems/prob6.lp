% >> Definición del problema <<
% Se resuelve con bound = 15.
rangeX(0..9).
rangeY(0..9).

robot(0..2).
box(0..2).

robotOn(0,2,4,0).
robotOn(1,1,4,0).
robotOn(2,0,4,0).

boxOn(0,2,5,0,0).
boxOn(1,4,5,0,0).
boxOn(2,6,5,0,0).

goal(9,5).
goal(9,4).
goal(8,4).

obstacle(0..9,0..3).

obstacle(0..1,6..9).
obstacle(2,7..9).
obstacle(3..9,6..9).

obstacle(1,5).
obstacle(3,4).
obstacle(5..6,4).
obstacle(8,5).
