% Define the points on the grid
point(X,Y) :- X=0..n-1, Y=0..n-1.

% Define the possible directions for the path
dir(up).
dir(down).
dir(left).
dir(right).

% Define the rules for black circles
% A black circle must be at a corner of the path
% The path cannot turn at the points before or after a black circle
black(X,Y) :- black(X,Y), dir(D), path(X,Y,D).
not path(X,Y,D) :- black(X,Y), opposite(D,D2), path(X,Y,D2).

% Define the rules for white circles
% The path must go straight through a white circle
% The path must turn at the point before or after a white circle
white(X,Y) :- white(X,Y), dir(D), path(X,Y,D).
not path(X,Y,D) :- white(X,Y), opposite(D,D2), path(X,Y,D2).

% Define the opposite directions
opposite(up, down).
opposite(down, up).
opposite(left, right).
opposite(right, left).

% Define the segment predicate
seg(N,M) :- point(X1,Y1), point(X2,Y2), N = X1*n+Y1, M = X2*n+Y2, adjacent(X1,Y1,X2,Y2).

% Define the adjacency relation between points
adjacent(X1,Y1,X2,Y2) :- (X1 is X2, Y1 is Y2+1) ; (X1 is X2, Y1 is Y2-1) ; (X1 is X2+1, Y1 is Y2) ; (X1 is X2-1, Y1 is Y2).
