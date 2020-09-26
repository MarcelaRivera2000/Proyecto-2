class MatrixGraph < TDA_Grafo
    def Matriz_Adyacencia( vertices )
    matriz[vertices][vertices]
        for i in(0..vertices)
            for j in(0..vertices)
                if i == j then matriz[i][j] = "INFINITO"
                else 

                end
            end
        end
    
    end
    def Prim
    end
    def Floyd
    end
end