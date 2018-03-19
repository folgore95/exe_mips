# Trasforma da C in Assembly
# for(i=0;i<=100;i=i+1) {
#  a[i]=b[i]+c; }

# Supponiamo che le matrici a e b siano agli indirizzi 1500 e 2000. Il registro 15 è i ed il registro 16 a c. 

#
# Suddivido le varie condizioni del for e poi unisco tutto
#

# i=0
add $15, $0, 0

# i=i+1
add $15, $15, 1

# i<=100
for1tst: slti $8, $15, 100   # $8=0 se i >= 100
         beq $8, $0, Exit   # Salto a exit se &15>100 quindi se $8 è uguale a 0

#
# Istruzione all'interno del for
#
lw $9, 2000(&15)
add $9, $16, $9
sw $9, 1500(&15)

# Codice finale

add $15, $0, 0
for1tst: slti $8, $15, 100
         beq $8, $0, Exit
         lw $9, 2000(&15)
         add $9, $16, $9
         sw $9, 1500(&15)
add $15, $15, 1  
j for1tst
      
