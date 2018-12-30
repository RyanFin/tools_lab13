all:
	yacc -d grammar.y
lex.yy.c: scanner.l	
	flex --noyywrap scanner.l
lcalc: y.tab.c lex.yy.c
	cc -o lcalc y.tab.c lex.yy.c

clean:
	
