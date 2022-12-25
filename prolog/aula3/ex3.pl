immature(X):- adult(X), !, fail. %%% red cut
immature(X).

adult(X):- person(X), !, age(X, N), N >=18.      %%% green cut
adult(X):- turtle(X), !, age(X, N), N >=50.     %%% green cut
adult(X):- spider(X), !, age(X, N), N>=1.     %%% green cut
adult(X):- bat(X), !, age(X, N), N >=5.   %%% green cut