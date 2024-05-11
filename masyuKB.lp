
%Estos parametros ya estan definidos
%#const n=6.
%black(0;12;26).
%white(10;13;22;23;31;34).


num(0..(n*n)-1).


{line(X,Y) : num(X), num(Y)}.

:- line(X,Y), X=Y. %Eliminar los que son iguales
:- line(X,Y), not line(Y,X). %Eliminar los que son simetricos
:- line(X,Y),(X / n) != (Y / n); (X \ n) != (Y \ n). %Eliminar los que no estan en la misma fila o columna
:- line(X,Y), |X - Y| > 1 ; |X - Y| != n. %Eliminar los que no son adyacentes



%Un numero tiene que tener o un segmento entrante o saliente o ninguno
:- num(X), #count{Y : line(X,Y)} = 1.
:- num(X), #count{Y : line(Y,X)} = 1.

:- num(X), #count{Y : line(X,Y)} = 3.
:- num(X), #count{Y : line(Y,X)} = 3.

:- num(X), #count{Y : line(X,Y)} = 4.
:- num(X), #count{Y : line(Y,X)} = 4.




% Define a path relation
path(X, Y) :- line(X, Y).

% Define the transitivity rule
path(X, Z) :- line(X, Y), path(Y, Z).

% Ensure that from any line you can reach any other line
:- num(X), num(Y),line(X,_),line(Y,_), not path(X, Y).






corner(X) :- line(Y,X),line(X,Z),Z!=Y, (Y / n) != (Z / n), (Y \ n) != (Z \ n). 

:- white(X),  corner(X). %No puede haber blancos en esquinas
:- white(X), not line(X,_). %Tiene que pasar por las blancas


:- white(X),line(X,X+1), not corner(X+1),line(X,X-1),not corner(X-1).
:- white(X),line(X,X+n), not corner(X+n),line(X,X-n),not corner(X-n).


:- black(X),not line(X,_). %TIene que pasar por los negros
:- black(X), not corner(X). %Tiene que estar en la esquina el negro
:- black(X),line(X,X+1), corner(X + 1).
:- black(X),line(X,X-1), corner(X - 1).
:- black(X),line(X,X+n), corner(X + n).
:- black(X),line(X,X-n), corner(X - n).




seg(X,Y) :- line(X,Y), X < Y.





#show seg/2.