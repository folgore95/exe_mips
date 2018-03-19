# Pag 128 
# Da C ad Assembly
# if ( i > j ) goto L1

# i = $19 // j=$20

slt $8, $19, $20   # $8=0 se $19 > $20 ( i > j )
bne $8, $0, Exit1
Exit1: ...
