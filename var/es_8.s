# Testo esercizio preso da http://www.diee.unica.it/~roli/SEI/modulo-calcolatori/slides/esercitazioni/es4.pdf

# Da codice C ad Assembly:
# int min( int v[], int n) {
#  int i, min_v;
#  min_v = v [0];
#  for(i=1); i<n;i++) {
#   if(v[i]<min_v) {
#    min_v=v[i];
#                  }
#                     }
# return min_v;
#                           }
# Direttive: &v[0] -> $4 // n -> $5 // il valore di ritorno in $6 // 
#            (i<n) -> $8 // (v[i]<min_v) -> $9 // i -> $10 // v[i] -> $11


# Svolgimento
min: addi $29, $29, -16   # Creo spazio sulla pila per allocare i registri
     sw $8, 0($29)   # Salvo i registri nella pila
     sw $9, 4($29)
     sw $10, 8($29)
     sw $11, 12($29)
     sw $6, 16($29)
     
     move $10, $0   # Copio 0 in i
for1tst: addi $10, $10, 1   # i=1
         slt $8, $10, $5   # 2 casi: - $8=1 se $10 <= $5
                           #         - $8=0 se $10 > $5
         beq $8, $0, Exit1   # Se il registro 8 per la condizione precedente vale 0 -> branch equal -> 0 = 0 salto a Exit1
         
         lw $11, 0($4)   # v[i]
         slt $9, $11, $6   # 2 casi: - $9=1 se $11 <= $6
                           #         - $9=0 se $11 > $6
         beq $9, $0, For
         move $6, $11   # Copio il valore di $11 in $6 -> v[i] in min_v
         j For   # Salto
Exit1:  lw $8, 0($29)   # Ripristino dei registri 
        lw $9, 4($29)
        lw $10, 8($29)
        lw $11, 12($29)
        lw $6, 16($29)
        addi $29, $29, 16   # Ripristino dello stack della pila
        jr $31
         
