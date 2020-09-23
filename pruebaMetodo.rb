load 'Arbol.rb'
load 'Nodo.rb'


puts "RAIZ: "
x=gets.chomp.to_i
raiz=Nodo.new(x)


puts "Hijo1: "
x=gets.chomp.to_i
nodo1=Nodo.new(x)
nodo1.setPadre(raiz)
raiz.setIzquierdo(nodo1)

puts "Hijo2: "
x=gets.chomp.to_i
nodo2=Nodo.new(x)
nodo2.setPadre(raiz)
raiz.setDerecho(nodo2)

arbol=Arbol.new(raiz)

arbol.postOrder(arbol.getRaiz)

puts "prueba: "
x=gets
arbol.codificador_Huffman(x)