Constantinescu Radu-Nicolae
334AC

Starile alese: 
starting_pos 
punctele cardinale (N,S,E,V)
verify_pos
empty
wall

Variabile ajutatoare:
state, next_state, prev_state si goBack
goBack ne spune ca a gasit peretele din dreapta si s-a intors.

Daca a inaintat in labirint (in orice directie) si gaseste culoar, in functie de prev_state va cauta peretele in dreapta.
Cand gaseste perete, activez variabila goBack si se intoarce (nemodificand prev_state pentru a sti in ce directie a gasit peretele). Apoi, in functie de prev_state, stie in ce directie va merge.

