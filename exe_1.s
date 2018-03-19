# C++ Codice

# swap(int v[], int k)
# {
# int temp;
# temp = v[k];
# v[k] = v[k+1]
# v[k+1]= temp;
# }

# Assembly Codice
# v = $4 // k = $5 // temp = $15 

swap: addi $29, $29, -12   # Creo spazio sulla pila ( 3 registri )
      sw $2, 0($29)   # Salvo i registri $2, $15, $16 nella pila
      sw $15, 4($29)
      sw $16, 8($29)
      
      muli $2, $5, 4   # $2= $5 * 4 ( k*4)
      add $2, $4, $2   # $2= v + (k*4)
      
      lw $15, 0($2)   # temp = v[k]
      lw $16, 4($2)   # temp = v[k+1]
      
      sw $16, 4($2)   # Scambio la locazione di memoria
      sw $15, 0($2)
      
      lw $2, 0($29)   # Ripristino dalla pila i registri
      lw $15, 4($29)
      lw $16, 8($29)
      addi $29, $29, 12   # Ripristino della pila
      
      jr $31   # Salto al registro
