load 'TDA_Arbol.rb'
load 'TDA_Grafo.rb'

Arbol = TDA_Arbol.new
Grafo = TDA_Grafo.new

def menu
    puts "*************MENU*************"
    puts "*1. Algoritmos sobre Árboles *"
    puts "*2. Algoritmos sobre Grafos  *"
    puts "*3. Salir                    *"
    puts "******************************"
    print "Ingrese una opcion: "
    opcion = gets.chomp.to_i
    if opcion == 3 then exit end
    puts "\n\n"
    return opcion
end

def Leer_Archivo
    print "Ingrese el nombre del archivo de texto: "
    texto = gets
    return texto.delete!("\n")
end

def Menu_Arboles
    puts "***********MENU ARBOLES***********"
    puts "*1. Leer Árbol de un archivo     *"
    puts "*2. Imprimir recorrido preorder  *"
    puts "*3. Imprimir recorrido in order  *"
    puts "*4. Imprimir recorrido postorder *"
    puts "*5. Codificador de Huffman       *"
    puts "*6. Decodificador de Huffman     *"
    puts "*7. Regresar al menú principal   *"
    puts "**********************************"
    print "Ingrese una opcion: "
    opcion = gets.chomp.to_i
    puts "\n\n"
    return opcion
end

def Menu_Grafos
    puts "**********MENU GRAFOS***********"
    puts "*1. Leer grafo de un archivo   *"
    puts "*2. Prim                       *"
    puts "*3. Kruskal                    *"
    puts "*4. Floyd                      *"
    puts "*5. Regresar al menú principal *"
    puts "********************************"
    print "Ingrese una opcion: "
    opcion = gets.chomp.to_i
    puts "\n\n"
    return opcion
end

def Acciones_Arbol( opcion )
    case opcion
        when 1 then Arbol.Leer( Leer_Archivo() )
        when 2 then Arbol.PreOrder()
        when 3 then Arbol.InOrder()
        when 4 then Arbol.PostOrder(arbol.getRaiz)
        when 5 then Arbol.Codificador_Huffman()
        when 6 then Arbol.Decodificador_Huffman()
    end
end

def Acciones_Grafos( opcion )
    case opcion
        when 1 then Grafo.Leer( Leer_Archivo() )
        when 2 then Grafo.Prim()
        when 3 then Grafo.Kruskal()
        when 4 then Grafo.Floyd()
    end
end

loop do
    opcion = menu()
    ( opcion == 1 )? Acciones_Arbol( Menu_Arboles() ) : Acciones_Grafos( Menu_Grafos() )
end