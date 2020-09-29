load 'TDA_Arbol.rb'
load 'TDA_Grafo.rb'
load 'Nodo.rb'

Arbol = TDA_Arbol.new
Grafo = TDA_Grafo.new

def menu
    puts ""
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

def Ingresar_Texto
    print "Ingrese el texto a codificar: "
    texto = gets
end

def Codificador
    print "Ingrese un texto: "
    texto = gets
    return texto.delete!("\n")
end

def Menu_Arboles
    puts ""
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
    puts ""
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
    loop do
        case opcion
            when 1 then Arbol.Leer( Leer_Archivo() )
            when 2 then Arbol.preOrder(Arbol.raiz)
            when 3 then Arbol.inOrder(Arbol.raiz)
            when 4 then Arbol.postOrder(Arbol.raiz)
            when 5 then Arbol.codificador_Huffman(Codificador())
            when 6 then Arbol.descodificador_Huffman()
        end
        opcion = Menu_Arboles()
        if( opcion == 7 ) then break end
    end
end

def Acciones_Grafos( opcion )
    loop do
        case opcion
            when 1 then 
                puts "************"
                puts "*1. Lista  *"
                puts "*2. Matriz *"
                puts "************"
                print "Ingrese una opcion: "
                op = gets.chomp.to_i
                Grafo.Leer( Leer_Archivo() )
            when 2 then Grafo.Prim()
            when 3 then Grafo.Kruskal()
            when 4 then Grafo.Floyd()
        end
        opcion = Menu_Grafos()
        if( opcion == 5 ) then break end
    end    
end

loop do
    opcion = menu()
    ( opcion == 1 )? Acciones_Arbol( Menu_Arboles() ) : Acciones_Grafos( Menu_Grafos() )
end