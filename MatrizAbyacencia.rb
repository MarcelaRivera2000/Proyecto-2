load 'Vertice.rb'
class MatrizAbyacencia
    def initialize(tam)
        @matrix=Array.new(tam,0){Array.new(tam,0)}
        @tamano=tam
    end
    def getMatriz
        return @matriz
    end
end

