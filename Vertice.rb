load 'Arista.rb'

class Vertice
    @lista = Array.new
    def initialize(n_dato)
        @dato=n_dato
    end
    def insertarArista( arista )
        @lista << arista
    end
    def getAristas
        return @lista
    end
end