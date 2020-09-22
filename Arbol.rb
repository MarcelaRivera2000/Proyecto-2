load 'Nodo.rb'
load 'TDA_Arbol.rb'
class Arbol < TDA_Arbol
    def initialize(n_raiz)
        @raiz=n_raiz
    end
    def leerArchivo
    end 
    def preorder
    end
    def postorden(raiz)
        if raiz != nil
            postorden(raiz.getIzquierdo)
            postorden(raiz.getDerecho)
            puts "[ #{raiz.getDato} ]"
        end
    end
    def codificador_Huffman
    end
    def descodificador_Huffman
    end
    def getRaiz
        return @raiz
    end
end

