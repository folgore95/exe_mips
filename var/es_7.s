# Testo esercizio preso da http://www.diee.unica.it/~roli/SEI/modulo-calcolatori/slides/esercitazioni/es4.pdf

# Da codice C ad Assembly:
# int proc(int g, int h, int i, int j) {
#  int f;
#  f = (g+h) - (i+j);
#  return f;
#  g, h , i, j sono nei registri $4 - $7 ; f venga restituito in $4 ; per allocare g+h -> $9 e i+j -> $10                                    }

# Svolgimento
proc: addi $29, $29, -8   # Creo spazio sulla pila per i registri // posso usare anche la sottraz. immediata: subi $29, $29, 8
      sw $10, 4($29)   # Salvo i 2 registri interessati nella pila
      sw $9, 0($29)
      
      add $9, $4, $5   # g+h
      add $10, $6, $7   # i+j
      sub $4, $9, $10   # f = (g+h)-(i+j)
      
      lw $10, 4($29)   # Ripristino i registri nella pila
      lw $9, 0($29)
      addi $29, $29, 8   # Ripristino dello stack della pila
      jr $31    # Ritorno alla procedura chiamante
