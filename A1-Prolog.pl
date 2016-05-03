% Name Andrew Creevey -- ID 12236284 %
% Name Jonny Jackson  -- ID 14089365 %

%-------------------------- Part 1 --------------------------
output :-
	writeln('--- 159.202 - Assignment 1 ---'),
    writeln('ID: 12236284,  Name: Creevey A'),
    writeln('------ All parts solved ------').

%-------------------------- Part 2 --------------------------
likes(tom,jerry).
likes(mary,john).
likes(mary,mary).
likes(tom,mouse).
likes(jerry,jerry).
likes(jerry, cheese).
likes(mary,fruit).
likes(john,book).
likes(mary,book).
likes(tom,john). 

%i-
%a
likes(john,X) :- 
	likes(mary,X).
%b
likes(john, X) :- 
	likes(X, cheese).

%ii-
	%a ?- likes(mary, X). 	output: john, mary, fruit, book.
	%b ?- likes(john, X).  	output: book, john, mary, fruit, book, cheese.
	%c ?- likes(X, book).	output: john, mary, john.
	
%-------------------------- Part 3 --------------------------
	
%Some Greek gods
male(apollo).
male(ares).
male(cronus).
male(coeus).
male(hades).
male(hephaestus).
male(oceanus).
male(poseidon).
male(uranus).
male(zeus).

/*Some Greek goddesses*/
female(aphrodite).
female(artemis).
female(demeter).
female(gaea).
female(hera).
female(hestia).
female(leto).
female(phoebe).
female(rhea).
female(hebe). %you forgot to include hebe

/*parents(person, father, mother)*/
parents(hestia, cronus, rhea).
parents(poseidon, cronus, rhea).
parents(hades, cronus, rhea).
parents(zeus, cronus, rhea).
parents(demeter, cronus, rhea).
parents(coeus, uranus, gaea).
parents(cronus, uranus, gaea).
parents(oceanus, uranus, gaea).
parents(phoebe, uranus, gaea).
parents(rhea, uranus, gaea).
parents(ares, zeus, hera).
parents(hebe, zeus, hera).
parents(hephaestus, zeus, hera).
parents(apollo, zeus, leto).
parents(artemis, zeus, leto).

brother(Person1, Person2) :- 
	male(Person1),
	parents(Person1, Father, Mother),
	parents(Person2, Father, Mother), 
	Person1 \= Person2.

%i-
%a
sister(Person1, Person2) :- 
	female(Person1),
	parents(Person1, Father, Mother),
	parents(Person2, Father, Mother), 
	Person1 \= Person2.
%b	
aunt(Person, Aunt) :-
	female(Aunt),
	parents(Person,Father,_),
	sister(Aunt,Father),
	Person \= Aunt.
	
aunt(Person, Aunt) :-
	female(Aunt),
	parents(Person,_,Mother),
	sister(Aunt,Mother),
	Person \= Aunt.

%c	
son(Person, Father) :- 
	male(Person), 
	parents(Person, Father, _),
	Person \= Father.

%ii-
%-(a)
	%?-aunt(apollo,X).
	%Apollos aunt's: demeter, hestia.

%b	
	%?-son(X,zeus).
	%Zues's sons: apollo, ares, hephaestus.

%-------------------------- Part 4 --------------------------

%i-
%a woman(name).
woman(anna).
woman(eve).
woman(julie).
woman(carmela).

%b man(name).
man(luc).
man(max).
man(hector).
%"marc with a c = cark"
man(marc).

%c height(name, height).
height(eve, 155).
height(julie, 165).
height(carmela, 159).
height(luc, 170).
height(max,190).

%d hair(name,colour)
hair(anna,blonde).
hair(eve, brunette).
hair(julie, red).
hair(carmela, blonde).

%ii- 
%a Petite rules ----------
petite(anna).

petite(Person) :- 
	woman(Person),
	(height(Person, H), H<160).

%b Prefers rule ----------
prefers(anna, Male) :-
	man(Male).
	
prefers(eve, Male) :-
	man(Male),
	prefers(Male,Female),
	petite(Female),
	hair(Female, brunette).

prefers(julie, Male) :-
	man(Male),
	height(Male, H), H > 165.

%undefined which gender carmela prefers. have assumed both male & female	
prefers(carmela, Male) :-
	man(Male).
prefers(carmela, Female) :-
	woman(Female),	
	Female \= carmela.

prefers(luc, Female) :-
	woman(Female),
	hair(Female, red).
	
prefers(max, Female) :-
	woman(Female),
	petite(Female),
	hair(Female, brunette).
	
prefers(marc, Female) :-
	woman(Female),
	hair(Female, brunette).

prefers(hector, Female) :-
	woman(Female),
	petite(Female),
	hair(Female, blonde).
	
%iii Match rule ----------
match(Person1, Person2) :-
	prefers(Person1, Person2),
	prefers(Person2, Person1).

%iv queries, I have included 3 different queries and their output
	% ?- match(anna,marc). 	
	% Output:
	% false.
	
	% ?- match(eve,Prefers). 
	% Output:
	% Prefers = max ;
	% Prefers = marc ;
	
	% ?- match(Name, Prefers). 
	% Output:
	% Name = anna,
	% Prefers = hector ;
	% Name = eve,
	% Prefers = max ;
	% Name = eve,
	% Prefers = marc ;
	% Name = julie,
	% Prefers = luc ;
	% Name = carmela,
	% Prefers = hector ;
	% Name = luc,
	% Prefers = julie ;
	% Name = max,
	% Prefers = eve ;
	% Name = marc,
	% Prefers = eve ;
	% Name = hector,
	% Prefers = anna ;
	% Name = hector,
	% Prefers = carmela ;

%------------------------------------------