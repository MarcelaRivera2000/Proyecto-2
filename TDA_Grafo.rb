load 'Vertice.rb'
load 'Arista.rb'

class TDA_Grafo 
    def initialize
        @nVertices = 0
        # @matriz_ = Array.new(){Array.new()}
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
                if( parametros[1].to_i == 0 )
                    parametros[1] = 999
                end
                if( i == j )
                    parametros[1] = 0
                end
                @matriz[i][j] = parametros[1].to_i
                j += 1
            end
            j = 0
            i += 1
        end  
        matrix(@matriz, @nVertices)
        rescue Exception => exc   
            puts "ERROR EN EL PROCESO!"
    end
    
    def Prim (grafo)
        
    end

    def Kruskal

    end
    
    def Floyd
        matriz2 = @matriz
        anterior = ik = ij = actual = minimo = 0
        for k in 0..@nVertices.to_i - 1 do
            for i in 0..@nVertices.to_i - 1 do
                for j in 0..@nVertices.to_i - 1 do
                    if( i.to_i != j.to_i && k.to_i != i.to_i && k.to_i != j.to_i )
                        anterior = (matriz2[i][j]).to_i
                        ik = (matriz2[i][k]).to_i
                        kj = (matriz2[k][j]).to_i
                        if( ik.to_i == 999 || kj.to_i == 999 )
                            actual = 999
                        else 
                            actual = ik.to_i + kj.to_i
                        end
                        if( actual != 999 && ( actual.to_i < anterior.to_i || anterior == 999))
                            minimo = actual
                        else
                            minimo = anterior
                        end
                        if( i == j ) then minimo = 0 end
                        matriz2[i][j] = minimo.to_i
                    end
                end
            end
        end
        matrix( matriz2, @nVertices )
        rescue Exception => exc   
            puts "ERROR EN EL PROCESO!"
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
        rescue Exception => exc   
            puts "ERROR EN EL PROCESO!"
    end

end
