Detalii generale
https://ocw.cs.pub.ro/courses/ac-is/teme/tema2

Detalii implementare
Omuletul din labirint nu dispune de memorie(nu retine calea pe care a urmat-o) si nici nu poate stii ce se afla in jurul lui(perete/culoar) decat la urmatorul ciclu de ceas. Am decis sa folosesc punctele cardinale pentru a putea decide unde sa caute peretele(din dreapta) si in ce directie sa o ia dupa ce l-a gasit. 
Pentru inceput, omuletul va verifica random una din pozitiile din jurul lui. Exista 2 posibile situatii: 
1. A gasit perete, caz in care se va roti 90' si va verifica urmatoarea pozitie 
2. A gasit culoar, caz in care va inainta in labirint

Starile alese 
  - starting_pos 
  - punctele cardinale (N,S,E,V)
  - verify_pos
  - empty
  - wall

Variabile ajutatoare: 
  - state
  - next_state 
  - prev_state 
  - goBack
