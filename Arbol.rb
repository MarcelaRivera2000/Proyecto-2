load 'Nodo.rb'
load 'TDA_Arbol.rb'
class Arbol < TDA_Arbol
  #  def initialize(n_raiz)
   #     @raiz = n_raiz
    #end
    def initialize
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
        for i in 0..texto.size 
            puts "hello"
        end
    end
    def descodificador_Huffman
    end
    def getRaiz
        return @raiz
    end
end

