begin :-
	welcome_message,
	questions.

welcome_message :- 
	writeln('Welcome to this ES about cocktails!'), 
	writeln('I am going to ask questions about cocktail flavors.'),
	writeln('Please answer yes. or no.'),
	writeln('Ready? '),
	read(yes);
	exit.

question(liquor) :-
	nl,
	writeln('What type of liquor do you want? ').

question(citrus) :-
	n1,
	writeln('What type of citrus would you like').



/* Drinks */
cocktail(margarita).
cocktail(rum_runner).
cocktail(mai_tai).
cocktail(bay_breeze).
cocktail(martini).
cocktail(appletini).
cocktail(south_beach).
cocktail(cosmopolitan).
cocktail(old_fashion).
cocktail(lemon_drop).
cocktail(kamikaze).
cocktail(pina_colada).
cocktail(sex_on_the_beach).
cocktail(hurricane).
cocktail(strawberry_daiquiri).

well([], _).
well([S | E], I) :-
	write(I), write(' '), well(S), nl, 
	Next is I + 1,
	well(E, Next).

query(Step, Response, Choices) :-
	dialog(Step),
	

exit :-
	writeln('bye'),
	halt(0).
