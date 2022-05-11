% >> Definición del problema <<
% Se resuelve con bound = 11.
rangeX(0..9).
rangeY(0..9).

robot(0..5).
box(0..5).

robotOn(0,0,9,0).
robotOn(1,4,9,0).
robotOn(2,8,9,0).
robotOn(3,8,4,0).

robotOn(4,0,7,0).
robotOn(5,4,7,0).

boxOn(0,0,8,0,0).
boxOn(1,2,5,0,0).
boxOn(2,4,8,0,0).
boxOn(3,6,5,0,0).
boxOn(4,8,8,0,0).
boxOn(5,8,3,0,0).

goal(0,0).
goal(2,0).
goal(4,0).
goal(6,0).
goal(9,6).
goal(9,0).

obstacle(1,0..3).
obstacle(1,5..9).

obstacle(3,0..9).

obstacle(5,0..3).
obstacle(5,5..9).

obstacle(7,0..9).

obstacle(8..9,5).
