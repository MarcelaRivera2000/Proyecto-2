class Nodo
    def initialize(n_dato)
        @dato=n_dato
        @padre=nil
        @hijoIzquierdo=nil
        @hijoDerecho=nil
    end

    def setPadre(n_padre)
        @padre=n_padre
    end
    def setDerecho(n_hijo)
        @hijoDerecho=n_hijo
    end
    def setIzquierdo(n_hijo)
        @hijoIzquierdo=n_hijo
    end

    def getIzquiedo
        return @hijoIzquierdo
    end
    def getDerecho
        return @hijoDerecho
    end
    def getPadre
        return @padre
    end
    def getDato
        return @dato
    end
end