load 'Vertice.rb'
class MatrizAbyacencia
    def initialize(tam,m)
        @matrix=Array.new(tam,0){Array.new(tam,0)}
        for i in 0 .. tam
            for j in 0.. tam
                if(i==j)
                    @matrix[i][j]=-1
                else
                    if(j<tam-1)
                        aux=m[i][j].getAristas
                        aux2=m[i][j+1].getAristas
                        for k in 0..aux2.size
                            cont=0
                            for n in 0..aux1.size
                                if(aux[k].getDestino==aux2[n].getDestino)
                                    @matrix[i][j]=1
                                end
                                if(cont==0)
                                    @matrix[i][j]=0
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    
    def getMatriz
        return @matriz
    end

end

