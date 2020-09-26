load 'Nodo.rb'
load 'TDA_Arbol.rb'

class Arbol < TDA_Arbol
    def initialize()
    end
    def setRaiz(n_raiz)
        @raiz=n_raiz
    end
    def getRaiz
        return @raiz
    end
    def leerArchivo
    end 
    def preorder
    end
    def postOrder(raiz)
        if raiz != nil
            postorden(raiz.getIzquierdo)
            postorden(raiz.getDerecho)
            puts "[ #{raiz.getDato} ]"
        end
    end
    def codificador_Huffman(texto)
        
    end
    
    def descodificador_Huffman
    end
end