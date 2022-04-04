direction(up).
direction(down).
direction(right).
direction(left).

1 {move(A) : direction(A)} 1.

% Lo anterior es análogo a escribir
% 1 {move(up); move(down); move(right); move(left)} 1.

move(right) :- move(up).
move(left) :- move(down).
move(left) :- move(right).

#show move/1.