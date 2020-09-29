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
        def Kruskal
            temp_aristas = []
            conjunto_solution = []
            for i in(0..vertices.length-1)
                temp_aristas = temp_aristas+vertices[i].lista
            end
            arista_temporal = nil
            
            for i in(0..temp_aristas.length-1)
                for j in(0..temp_aristas.length-1)
                    if(temp_aristas[i].v_peso<temp_aristas[j].v_peso)
                        arista_temporal=temp_aristas[j];
                        temp_aristas[j]=temp_aristas[i];
                        temp_aristas[i]=arista_temporal;
                    end
                end
            end
            
            conjunto_solution[conjunto_solution.length] = temp_aristas[0];
            ultimo = 0
            for i in(1..temp_aristas.length-1)
                control = 1
                for j in(0..conjunto_solution.length-1)
                    if(conjunto_solution[j].v_origen == temp_aristas[i].v_origen && control == 1)
                        control = 0
                    else
                        if(conjunto_solution[j].v_destino == temp_aristas[i].v_destino && control == 1)
                            control = 0
                        else
                            if(conjunto_solution[j].v_origen == temp_aristas[i].v_destino && control == 1)
                                control = 0
                            else
                                if(conjunto_solution[j].v_destino == temp_aristas[i].v_origen && control == 1)
                                    control = 0
                                end
                            end
                        end
                    end
                end
                if control == 1
                    conjunto_solution[conjunto_solution.length] = temp_aristas[i]
                    ultimo = i+1
                end
            end
            
            vertice_Kus = []
            for i in(0..conjunto_solution.length-1)
                vertice_Kus[i] = Vertice.new
                vertice_Kus[i].lista[0] = conjunto_solution[i]
            end
            for i in (ultimo..temp_aristas.length-1)
    
                evalua1= -1
                evalua2 = -1
                evalua1_en = -1
                evalua2_en = -1
                for j in(0..vertice_Kus.length-1) 
                    cont = 0
                    for k in (0..vertice_Kus[j].lista.length-1)
                        if(temp_aristas[i].v_origen == vertice_Kus[j].lista[k].v_destino )
                            cont+=1
                            evalua1 = j
                            evalua1_en = k
                        else
                            if(temp_aristas[i].v_destino == vertice_Kus[j].lista[k].v_origen )
                                cont+=1
                                evalua2 = j
                                evalua2_en = k
                            end
                        end
                    end
                    if(cont >= 1)
                        j = vertice_Kus.length
                    end 
                end
                if(evalua1 != evalua2)
                    if(evalua2 == -1)
                        vertice_Kus[evalua1].lista[vertice_Kus[evalua1].lista.length] = vertice_Kus[evalua1].lista[0]
                        vertice_Kus[evalua2].lista.delete_at(evalua2_en)
                        if(vertice_Kus[evalua2].lista.length == 0)
                            vertice_Kus.delete_at(evalua2)
                        end
                    else
                        vertice_Kus[evalua1].lista[vertice_Kus[evalua1].lista.length] = vertice_Kus[evalua2].lista[evalua2_en]
                        vertice_Kus[evalua2].lista.delete_at(evalua2_en)
                        if(vertice_Kus[evalua2].lista.length == 0)
                            vertice_Kus.delete_at(evalua2)
                        end
                    end
                    vertice_Kus[evalua1].lista[vertice_Kus[evalua1].lista.length] = temp_aristas[i]
                end
            end
            for i in(0..vertice_Kus[0].lista.length-1)
                puts vertice_Kus[0].lista[i].toString
            end
        end
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
