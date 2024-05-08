num(0..(n*n)-1).

{seg(X,Y) : num(X), num(Y)}.

:- seg(X,Y), X=Y. %Eliminar los que son iguales
:- seg(X,Y), seg(Y,X). %Eliminar los que son simetricos
:- seg(X,Y),(X / n) != (Y / n); (X \ n) != (Y \ n). %Eliminar los que no estan en la misma fila o columna
:- seg(X,Y), |X - Y| > 1 ; |X - Y| != n. %Eliminar los que no son adyacentes




#show seg/2.
