закуска("артишоки в белом соусе", 100).
закуска("трюфели", 200).
закуска("салат", 150).

мясо("жаркое", 650).
мясо("цыпленок", 700).

рыба("окунь", 340).
рыба("судак", 540).

десерт("мороженое", 800).
десерт("земляника", 140).
десерт("дыня", 70).

/* 
второе_блюдо(Блюдо) :- рыба(Блюдо) ; мясо(Блюдо).
*/

мясо(Блюдо, _), мясо(Блюдо, _).

второе_блюдо(Блюдо) :- мясо(Блюдо, _).
второе_блюдо(Блюдо) :- рыба(Блюдо, _).

обед(X, Y, Z) :- закуска(X, _), второе_блюдо(Y), десерт(Z, _).

калорийность(Блюдо, Калорийность) :- закуска(Блюдо, Калорийность).
калорийность(Блюдо, Калорийность) :- рыба(Блюдо, Калорийность).
калорийность(Блюдо, Калорийность) :- мясо(Блюдо, Калорийность).
калорийность(Блюдо, Калорийность) :- десерт(Блюдо, Калорийность).

калории(Блюдо1, Блюдо2, Блюдо3, Калорийность) :- 
    калорийность(Блюдо1, К1), 
    калорийность(Блюдо2, К2),
    калорийность(Блюдо3, К3), 
    Калорийность = К1 + К2 + К3.
    
сбалансированный_обед(X, Y, Z) :- обед(X, Y, Z), калории(X, Y, Z, К), К < 800.


max(X, Y, Result) :- X > Y, Result = X. 
max(X, Y, Result) :- X =< Y, Result = Y.

