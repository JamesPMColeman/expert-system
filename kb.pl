begin :-
	welcome_message,
	clear,
	get_cocktail(Cocktail),
	write(Cocktail).

welcome_message :- 
	writeln('Welcome to this ES about cocktails!'), 
	writeln('I am going to ask questions about cocktail types.'),
	writeln('Please answer yes. or no.'),
	writeln('Ready? '),
	read(yes);
	exit.

exit :-
	writeln('bye'),
	halt(0).

:- dynamic(recipe/2).

clear :-
	retract(recipe(_,_)),
	fail.
clear.

get_cocktail(Cocktail) :-
	cocktail(Cocktail),
	!.



/* Drinks */
cocktail(margarita)   :- spirit('tequila').
cocktail(rum_runner)  :- spirit('rum').
cocktail(martini)     :- spirit('gin').
cocktail(appletini)   :- spirit('vodka').
cocktail(old_fashion) :- spirit('whiskey').


% cocktail(mai_tai) :-
%	spirit('rum'), query('orange')
%cocktail(bay_breeze) :-
%	spirit('rum'), query('coconut')
%cocktail(south_beach).
%	spirit('vodka').
%cocktail(cosmopolitan) :-
%	spirit('vodka').
%cocktail(lemon_drop) :-
%	spirit('vodka'), query('citrus').
%cocktail(kamikaze) :-
%	spirit('vodka').
%cocktail(pina_colada) :-
%	spirit('rum').
%cocktail(sex_on_the_beach) :-
%	spirit('vodka').
%cocktail(hurricane) :-
%	spirit('vodka').
%cocktail(strawberry_daiquiri) :-
%	spirit('rum').


spirit(Spirit) :-
	recipe(spirit, Spirit).
spirit(Spirit) :-
	\+ recipe(spirit, _),
	query(spirit, Spirit, [tequila, vodka, rum, whiskey, gin]).
	

query(Step, Spirit, []).
query(Step, Spirit, [C | E]) :-
	question(Step),
	writeln(C),
	read(yes) -> 
		assert(recipe(spirit, C)),
		C = Spirit,
		query(Step, C, []); 
	  	query(Step, Spirit, E).

question(spirit) :-
	nl,
	writeln('What type of liquor do you want? ').

question(citrus) :-
	n1,
	writeln('What type of citrus would you like').

