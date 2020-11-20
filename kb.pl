begin :-
	welcome_message,
	clear,
	get_cocktail(Cocktail) -> (
		format('I think you will enjoy a ~w as your cocktail', [Cocktail])
	).
	

welcome_message :- 
	writeln('Welcome to this ES about cocktails!'), 
	writeln('I am going to ask questions about cocktail types.'),
	writeln('Please answer yes. or no.'),
	writeln('Ready? '),
	read(yes);
	exit.

test :-
	writeln('HERE').

exit :-
	writeln('bye'),
	halt(0).

:- dynamic(drink_info/2).

clear :-
	retract(drink_info(_,_)),
	fail.
clear.

get_cocktail(Cocktail) :-
	cocktail(Cocktail),
	cocktail(Cocktail).

/* Drinks */
cocktail(margarita) :- 
	spirit('tequila'),
	time_of_day('evening'),
	citrus('lime').

cocktail(paloma) :- 
	spirit('tequila'),
	time_of_day('evening'),
	citrus('grapefruit').

cocktail(tequila_sunrise) :- 
	spirit('tequila'),
	time_of_day('day_time'),
	pallet('sweet').

cocktail(bloody_maria) :- 
	spirit('tequila'),
	time_of_day('day_time'),
	pallet('savory').

cocktail(bloody_mary) :- 
	spirit('vodka'), 
	time_of_day('day_time').

cocktail(lemon_drop) :- 
	spirit('vodka'), 
	time_of_day('evening'),
	flavor_vodka('lemon').

cocktail(moscow_mule) :- 
	spirit('vodka'),
	time_of_day('evening'),
	flavor_vodka('ginger').

cocktail(vodka_martini) :- 
	spirit('vodka'),
	time_of_day('evening'),
	flavor_vodka('i_just_want_to_look_cool').

cocktail(pina_colada) :-
	spirit('rum'),
	flavor_rum('coconut').

cocktail(dark_and_stormy) :-
	spirit('rum'),
	flavor_rum('ginger').

cocktail(mai_tai) :- 
	spirit('rum'),
	flavor_rum('lime').

cocktail(strawberry_daiquiri) :-
	spirit('rum'),
	flavor_rum('strawberry').

cocktail(gin_martini) :- 
	spirit('gin').

cocktail(gin_and_tonic) :- 
	spirit('gin').

cocktail(gimlet) :- 
	spirit('gin').

cocktail(negroni) :- 
	spirit('gin').

cocktail(old_fashion) :- 
	spirit('whiskey'),
	type_of_person('old_soul').

cocktail(whiskey_sour) :- 
	spirit('whiskey'),
	type_of_person('ive_got_two_sides').

cocktail(irish_coffee) :- 
	spirit('whiskey'),
	type_of_person('moning_person').

cocktail(manhattan) :- 
	spirit('whiskey'),
	type_of_person('sophisticated').

cocktail(different) :-
	nl,
	writeln('It appears that we do not have that drink on the menu'),
	writeln('Let\'s try again.'),
	nl,
	begin.


spirit(Spirit) :-
	drink_info(spirit, Spirit).
spirit(Spirit) :-
	\+ drink_info(spirit, _),
	query(spirit, Spirit, [tequila, vodka, rum, gin, whiskey]).

time_of_day(Time) :-
	drink_info(time_of_day, Time).
time_of_day(Time) :-
	\+ drink_info(time_of_day, _),
	query(time_of_day, Time, [day_time, evening]).

citrus(Citrus) :-
	drink_info(citrus, Citrus).
citrus(Citrus) :-
	\+ drink_info(citrus, _),
	query(citrus, Citrus, [lime, grapefruit]).	

pallet(Pallet) :-
	drink_info(pallet, Pallet).
pallet(Pallet) :-
	\+ drink_info(pallet, _),
	query(pallet, Pallet, [savory, sweet]).	

flavor_vodka(Flavor) :-
	drink_info(flavor, Flavor).
flavor_vodka(Flavor) :-
	\+ drink_info(flavor, _),
	query(flavor, Flavor, [lemon, ginger, i_just_want_to_look_cool]).

flavor_rum(Flavor) :-
	drink_info(flavor, Flavor).
flavor_rum(Flavor) :-
	\+ drink_info(flavor, _),
	query(flavor, Flavor, [coconut, lime, ginger, strawberry]).

type_of_person(Person) :-
	drink_info(type_of_person, Person).
type_of_person(Person) :-
    \+ drink_info(type_of_person, _),
	query(type_of_person, Person, [old_soul, ive_got_two_sides, morning_person,sophisticated]).

query(Step, Answer, []) :-
	assert(drink_info(Step, false)).
query(Step, Answer, [C | E]) :-
	question(Step),
	write(C),
	writeln('?'),
	read(yes) -> 
		assert(drink_info(Step, C)),
		Answer = C,
		query(Step, Answer, []); 
	  	query(Step, Answer, E).

question(spirit) :-
	nl,
	write('What type of liquor do you want: ').

question(time_of_day) :-
	nl,
	write('What time of day would you like to enjoy this drink: ').

question(citrus) :-
	nl,
	write('What type of citrus would you like: ').

question(pallet) :-
	nl,
	write('Would you like savory or sweet: ').

question(flavor) :-
	nl,
	write('What flavor would you like your drink: ').

question(type_of_person) :-
	nl,
	write('What type of person are you: ').
