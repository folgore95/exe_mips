# Codice C++

# clear1(int array[], int size) {
#  int i;
#  for(i=0;i<size;i=i+1) {
#                          array[i]=0;
#                        }
#                                }     

# Codice Assembly
# i=$2 // array=$4 // size=$5

move $2, $0   # i=0
loop1 muli $14, $2, 4   # $14=i*4 -> $2*4
add $3, $4, $14   # indirizzo array[i]
sw $0, 0($3)   # array[i]=0 passo dai registri alla memoria
addi $2, $2, 1   # i=i+1
slt $6, $2, $5   # $6= i < size -> $2 < $5
bne $6, $0, Loop1   # Salto a loop1 se $2 < $5 ed quindi $6 diverso da $0
