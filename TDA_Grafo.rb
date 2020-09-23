load 'Vertice.rb'
load 'Arista.rb'

class TDA_Grafo 
    def initialize
    end
    #$matriz = Array.new(1000){ Array.new(1000) }
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
        nVertices = 0
        archivoTxt = "/home/james/Escritorio/prueba14"   
        archivo = File.read( archivoTxt )
        lines = archivo.split("\n")
        vertices = Array.new
        contador = 0
        File.foreach( archivoTxt ) do |line|
            if contador != 0
                vertices << line
            else
                nVertices = line
            end
            contador += 1
        end
        i = j = 0
        vertices.each do |elemento|
            datos = elemento.split(";")
            datos.each do |elementos|
                parametros = elementos.split(",")
                Matriz_Adyacencia( i, j, parametros[1].to_i, nVertices )
                usarParametros( parametros )
                j += 1
            end
            i += 1
        end    
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
end
