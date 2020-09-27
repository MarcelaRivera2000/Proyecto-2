load 'Vertice.rb'
load 'Arista.rb'
load 'MatrizAbyacencia.rb'

class TDA_Grafo 
    def initialize
        @nVertices = 0
        @matriz_ = Array.new(){Array.new()}
    end

    def Matriz_Adyacencia( i, j, peso, nVertices )
        matriz = Array.new(nVertices.to_i){ Array.new(nVertices.to_i) }
        if( i.to_i == -1 && j.to_i == -1 ) then matriz[i.to_i][j.to_i] = "INFINITO" 
            else
                matriz[i.to_i][j.to_i] = peso.to_i
        end
        for fila in(0..nVertices.to_i)
            for columna in(0..nVertices.to_i)
                print "[#{matriz[fila][columna]}]"
            end
            puts ""
        end
    end 

    def Leer( archivoTxt )
        archivo = File.read( archivoTxt )
        lines = archivo.split("\n")
        vertices = Array.new
        contador = 0
        File.foreach( archivoTxt ) do |line|
            if contador != 0
                vertices << line
            else
                @nVertices = line
            end
            contador += 1
        end
        i = j = 0
        @matriz = Array.new(@nVertices.to_i){ Array.new(@nVertices.to_i) }
        vertices.each do |elemento|
            datos = elemento.split(";")
            datos.each do |elementos|
                parametros = elementos.split(",")
                @matriz[i][j] = parametros[1].chomp("\n")
                j += 1
            end
            j = 0
            i += 1
        end  
        matrix(@matriz, @nVertices)  
    end
    
    def Prim

    end
    
    def Kruskal

    end
    
    def Floyd
    
    end

    def usarParametros( elementos )
        puts "Destino: #{elementos[0]} Y Peso: #{elementos[1]}" 
    end

    def matrix( matriz, nVertices )
        for fila in(0..nVertices.to_i-1)
            for columna in(0..nVertices.to_i-1)
                print "[#{matriz[fila][columna]}]"
            end
            puts ""
        end
    end

end
