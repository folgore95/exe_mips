# Pag 127 
# Trasformo da C ad Assembly
# while(save[i] == k) {
#  i=i+j;
#                     }

# i=$19 // j=$20 // k=$21

Loop: muli $9, $19, 4   # Incremento i di 4 byte
      lw $8, save(&9)   # Passo da memoria a registri size[i]
      bne $8, $21, Exit1    # Se $8 è diverso da $21 salto a Exit1
      
      add $19, $19, $20   # i=i+1
      
      j Loop   # Passaggio tra salti incond. e condiz.
      Exit1:
