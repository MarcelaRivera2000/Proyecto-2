class Nodo
    attr_accessor :dato , :padre , :hijoIzquierdo , :hijoDerecho
    def initialize(n_dato,padre)
        self.dato=n_dato
        self.padre=padre
        self.hijoDerecho=nil
        self.hijoIzquierdo=nil
    end 
end