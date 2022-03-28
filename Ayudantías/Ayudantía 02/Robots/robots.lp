% RECORDAR QUE ESTA PAUTA NO RESUELVE EL HECHO DE QUE SE TRANSMUTEN LAS POSICIONES DE LOS ROBOTS
% ADEMÁS, LOS 'bound' SEÑALADOS SON PARA CUANDO RESUELVAN DICHO PROBLEMA. ESTO QUEDA COMO DESAFÍO :)

% Existirá un máximo de instantes de tiempo, denotado por la constante bound que se puede ingresar 
% por consola o predefinirla:

% Los robots cuentan con 5 acciones posibles, moverse en las 4 direcciones o no hacer nada


% Para cada instante de tiempo T, cada robot R puede ejecutar una única acción de las 5 posibles:

% El predicado 'on' indica que un robot R, está en una posición (X,Y) en un tiempo T. Por su parte, 
% el predicado 'exec' muestra que el robot R ejecuta la acción A en un tiempo T. Por lo tanto, se 
% puede definir la posición de un robot en T+1 según la acción A que se haya ejecutado:

% Se descartan los modelos en los que un robot haya ejecutado una acción que lo sacaría del mapa:

% Se descartan los modelos en los que un robot haya ejecutado una acción que lo haga chocar:

% [NO BORRAR] El resto de líneas son necesarias para que el visualizador funcione correctamente:
% goal(R,X,Y,T) :- goal(R,X,Y), time(T).
% goal(R,X,Y,0) :- goal(R,X,Y).

% #show on/4.
% #show obstacle/2.
% #show rangeX/1.
% #show rangeY/1.
% #show exec/3.
% #show goal/4.