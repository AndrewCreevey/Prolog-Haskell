% Name Andrew Creevey -- ID 12236284 %
% Name Luke Turner    -- ID 14125991 %

%-------------------------- Part 1 --------------------------
output :-
	writeln('--- 159.202 - Assignment 2 ---'),
    writeln('ID: 12236284,  Name: Creevey A'),
    writeln('ID: 14125911,  Name: Turner, L'),
    writeln('------ All parts solved ------').

%-------------------------- Part 2 --------------------------
%First operator =>>
:- op(400, xfy, =>>).
=>>(X,Y) :- 
	X is (Y*2). 

%Second operator isSingleton
:- op(500, fy, isSingleton).
	isSingleton [_].
	
%-------------------------- Part 3 --------------------------
% a) --------------------
% totalInList(L, N).

totalInList([], 0).	/*base case*/
totalInList([Head | Tail], Sum) :-
	totalInList(Tail, X), Sum is Head + X.
	
% b) --------------------
% count(Word, List, N).

count(_, [], 0). /*base case*/
count(Word, [Word|List], N) :- 
	count(Word, List, Y),
	N is Y + 1.
count(Word, [X|List], N) :- 
	count(Word, List, N),
	Word \= X. 

% c) --------------------
% adjAve (L,Ave).

adjAve([] ,[]). /*base case	(when both X & Y are empty)*/
adjAve([_],[]).	/*base case (when there is only the X value remaining)*/
adjAve([X,Y|Tail],[A|Ave]) :-
	A is (X+Y)/2,
	adjAve(Tail,Ave).
	
% d) i) --------------------
% word/2

word(one, un).
word(two, deux).
word(three, trois).
word(four, quatre).
word(five, cinq).
word(six, six).
word(seven, sept).
word(eight, huit).
word(nine, neuf).
word(ten, dix).

% d) ii) --------------------
% translate (EnglishNr, FrenchNr).

englishNr(one, un).
englishNr(two, deux).
englishNr(three, trois).
englishNr(four, quatre).
englishNr(five, cinq).
englishNr(six, six).
englishNr(seven, sept).
englishNr(eight, huit).
englishNr(nine, neuf).
englishNr(ten, dix).

% base case 
translate([],[]). 
translate([EngH|EngT], [FrenchH|FrenchT]) :- 
	englishNr(EngH,FrenchH), /*Take the first English value in the list and display French one*/
	translate(EngT,FrenchT). /*Pass through tail of both lists*/

%-------------------------- Part 4 --------------------------
% Latin square (4*4).

/* Generate square function -------------------- */
generateSq(X) :-
	% fill the square
	fillSq(X),
	% test square
	testSq(X),
	% display line at top of square
	writeln(''), horizontalLine,
	% display square
	displaySq(X).

/* i) Fill case -------------------- */
% base case 
fillSq([]).

% fill case
fillSq([List1,List2,List3,List4]) :-
	permutation([a,b,c,d], List1),
	permutation([a,b,c,d], List2),
	permutation([a,b,c,d], List3),
	permutation([a,b,c,d], List4).

/* ii) Test case -------------------- */
% base case
testSq([[],[],[],[]]).

% recursive case 
testSq([[H1|T1],[H2|T2],[H3|T3],[H4|T4]]) :-
	% test row
	H1 \= T1, H2 \= T2, H3 \= T3, H4 \= T4,
	% test columns
	H1 \= H2, H1 \= H3, H1 \= H4,
	H2 \= H3, H2 \= H4, H3 \= H4,
	testSq([T1,T2,T3,T4]).

/* iii) Display case -------------------- */	
% base case
displaySq([]). 

% recursive case
displaySq([A|Rest]) :-
	printit(A),
	horizontalLine,
	displaySq(Rest).

% prints the next line properly
printit([A,B,C,D]) :-
	write('| '), write(A),
	write(' | '), write(B),
	write(' | '), write(C),
	write(' | '), write(D), writeln(' |').
	
% horizontal line
horizontalLine :-
	tab(10),writeln('-----------------'), tab(10).
	
	
%------------------------------------------------------------