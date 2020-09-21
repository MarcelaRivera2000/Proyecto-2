load 'Vertice.rb'
load 'Arista.rb'

class TDA_Grafo 
    def initialize()
    end
    def Leer( archivoTxt )
        archivoTxt = "/home/james/Escritorio/prueba14"   
        archivo = File.read( archivoTxt )
        lines = archivo.split("\n")
        vertices = Array.new
        contador = 0
        File.foreach( archivoTxt ) do |line|
            if contador != 0
                vertices << line
            end
            contador += 1
        end
        vertices.each do |elemento|
            datos = elemento.split(";")
            puts ""
            datos.each do |elementos|
                parametros = elementos.split(",")
                usarParametros( parametros )
            end
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
