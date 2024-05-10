
%Estos parametros ya estan definidos
%#const n=6.
%black(0;12;26).
%white(10;13;22;23;31;34).


num(0..(n*n)-1).


{seg(X,Y) : num(X), num(Y)}.

:- seg(X,Y), X=Y. %Eliminar los que son iguales
:- seg(X,Y),X<Y, seg(Y,X). %Eliminar los que son simetricos
:- seg(X,Y),(X / n) != (Y / n); (X \ n) != (Y \ n). %Eliminar los que no estan en la misma fila o columna
:- seg(X,Y), |X - Y| > 1 ; |X - Y| != n. %Eliminar los que no son adyacentes



%Un numero tiene que tener o un segmento entrante o saliente o ninguno
:- num(X), #count{Y : seg(X,Y)} = 1.
:- num(X), #count{Y : seg(Y,X)} = 1.


:- num(X), #count{Y : seg(X,Y)} = 3.
:- num(X), #count{Y : seg(Y,X)} = 3.

:- num(X), #count{Y : seg(X,Y)} = 4.
:- num(X), #count{Y : seg(Y,X)} = 4.




reach(X,Y) :- seg(X,Y).
reach(X,Y) :- seg(X,Z), reach(Z,Y).




#show seg/2.


