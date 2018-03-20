# Testo esercizio preso da http://www.diee.unica.it/~roli/SEI/modulo-calcolatori/slides/esercitazioni/es4.pdf
# Caricare nel registro $16 la seguente costante di 32 bit:
# 0000 0000 0011 1100 0000 1001 0000 0001

# Svolgimento
# Prendo i 16 bit piu significativi ( conto da sx )
# 0000 0000 0011 1100 -> 60 in decimale in base 10

# Prendo i 16 bit meno significativi ( i restanti )
# 0000 1001 0000 0001 -> 2305 in decimale in base 10

# Codice Assembly
move $16, $0   # sposto zero nel registro 16
lui $16, 60   # caricamento immediato di una costante nei 16 bit piu significativi
addi $16, $16, 2305   # somma immediata del valore decimale dei 16 bit meno significativi

