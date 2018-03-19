# pag. 128
# L'istruzione: beq $2, $3, L1 
# Non puo essere sostituita da un valore immediato 14 al posto di $3
# Scrivi una sequenza d'istruzioni che salti a L1 se $2=14

addi $8, $0, 14   # $8=0+14
beq $2, $8, L1   # Il registro 8 che vale 14 viene confrontato con il registro 2 
                 # e se il registro 2 è uguale al registro 8 salto a L1
L1: ...


