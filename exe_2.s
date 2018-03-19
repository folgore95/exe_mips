# C++ Codice
 
# int v[10000];
# sort (int v[], int n)
# {
# int i,j;
# for (i=0;i<n;i=i+1) { 
#  for(j=i-1; j>=0 && v[j]>v[j+1]; j=j-1) {
#   swap(v, j);
#                                         }
#                     }
# }

# Assembly codice
# v = $4 // n = $5 // i = $19 // j = $17

sort: addi $29, $29, -36   # Spazio sulla pila per 9 registri
      sw $15, 0($29)    # Salvo i 9 registri sulla pila
      sw $16, 4($29)
      sw $17, 8($29)
      sw $18, 12($29)
      sw $19, 16($29)
      sw $20, 20($29)
      sw $24, 24($29)
      sw $25, 28($29)
      sw $31, 32($29)
      
      move $18, $4   # Copio $4 in $18
      move $20, $5   # Copio $5 in $20
       
      add $19, $0, $0   # i = 0
      # Primo ciclo for
      for1tst: slt $8, $19, $20   # $8 = 0 se $19 >= $20
               beq $8, $0, Exit1   # Salto a Exit1 se $8 = $0
               
      addi $17, $19, -1   # j = i-1
      # Secondo ciclo for 
      for2tst: slti $8, $17, 0   # $8 = 1 se $17 < 0
               bne $8, $0, Exit2   # Salto a Exit2 se $8 è diverso da $0 (0)
               muli $15, $17, 4   # $15=$17*4 -> j*4
               add $16, $18, $15   # $16 = v+(j*4)
               lw $24, 0($16)   # $24 = v[j]
               lw $25, 4($16)   #25 = v[j+1]
               slt $8, $25, $24   # $8 = 0 se $25 >= $24
               beq $8, $0, Exit2   # Salto a Exit2 se $8 è uguale a $0
               
      # Passaggio parametri e chimata
      move $4, $18   # swap( v ... )
      move $5, $17   # swap( ... j )
      jal swap
      
      # Secondo ciclo for 
      addi $17, $17, -1   # j = j-1
      j for2tst   # Salto
      
      # Primo ciclo for 
      Exit2: addi $19, $19, 1   # i=i+1
      j for1tst  # Salto
      
      # Ripristino dei registri
      Exit1: lw $15, 0($29)
             lw $16, 4($29)
             lw $17, 8($29)
             lw $18, 12($29)
             lw $19, 16($29)
             lw $20, 20($29)
             lw $24, 24($29)
             lw $25, 28($29)
             lw $31, 32($29)
             addi $29, $29, 36   # Ripristino pila
             jr $31   # Salto ai registri
      
