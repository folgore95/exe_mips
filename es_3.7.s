# Pag 127 
# Mostrare la singola istruzione MIPS o la sequenza minima d'istruzioni per il seguente costrutto C:
# x[10]=x[11]+c

addi $16, $0, 11   # $16 <- 11
muli $15, $16, 4   # $15=$16*4
lw $14, 1024($15)   # Passo il $15 dalla memoria ai registri
add $14, $14, $13   # $14=$14+$13 -> $14= x[11]+c
subi $15, $15, 4   # Tolgo a $15 4 byte
sw $14, 1024($15)
