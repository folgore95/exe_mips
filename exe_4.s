# Codice C++

# clear2(int array[], int size) {
#  int *p;
#  for(p=&array[]; p<&array[size]; p=p+1) {
#                          *p=0;
#                        }
#                                }     

# Codice Assembly
# p=$2 // array=$4 // size=$5

move $2, $4   # p = indirizzo array[0]
muli $14, $5, 4   # $14= size*4 -> $5*4
add $3, $4, $14   # indirizzio array[size]
loop2: sw $0, 0($2)   # Memoria[p]=0
       addi $2, $2, 4   # p=p+4
       slt $6, $2, $3   # $6= (p<array[size])
       bne $0, $0, loop2   # Salto a loop2
