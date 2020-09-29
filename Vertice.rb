load 'Arista.rb'

class Vertice
    attr_accessor :lista ,:n_dato
    def initialize(n_dato=0)
        self.n_dato=n_dato
        self.lista = []
    end
    def insertarArista( arista )
        lista[lista.length] = arista
    end
    def getAristas
        return @lista
    end
end