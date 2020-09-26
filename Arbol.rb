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
        array=Array.new
        for i in 0..texto.size 
            aux= texto[i]
            cont=0
            for j in 0..texto.size 
                if(texto[j]==aux)
                    cont++
                end
            end
            aux2=obj.new(aux,cont)
            array << aux2
        end
    end
    def descodificador_Huffman
    end
    def getRaiz
        return @raiz
    end
end

class obj
    def initialize(s,n)
        @sim=s
        @num=n
    end
    def getSim
        return @sim
    end
    def getNum
        return @num
    end
end

