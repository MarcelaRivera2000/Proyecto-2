load "Nodo.rb"

class TDA_Arbol
    attr_accessor :raiz
    def initialize()
        
    end 

    def preOrder(raiz)
        if raiz != nil
            print "[ #{raiz.dato} ]"
            preOrder(raiz.hijoIzquierdo)
            preOrder(raiz.hijoDerecho)
        end
    end

    def inOrder(nodo_r)
        if(nodo_r == nil)
            return 
        else
            inOrder(nodo_r.hijoIzquierdo)
            print "[ #{nodo_r.dato} ]"
            inOrder(nodo_r.hijoDerecho)
        end
    end

    def postOrder(raiz)
        if raiz != nil
            postOrder(raiz.hijoIzquierdo)
            postOrder(raiz.hijoDerecho)
            print "[ #{raiz.dato} ]"
        end
    end

    def codificador_Huffman()
        
    end
    def descodificador_Huffman
    end

    def Leer( archivoTxt )
        if(File.file?(archivoTxt))
            archivo = File.read( archivoTxt )
            lines = archivo.split("\n")
            numero_hijos = lines[0].to_i
            i = lines.length-1;
            nodos = []
            
            while (i>0)
                if(lines[i] != "")
                    hijos = lines[i].split(",")
                    nodo_nuevo = Nodo.new
                    n_derecho = Nodo.new
                    n_izquierdo = Nodo.new
                    n_derecho.dato = hijos[1]
                    n_izquierdo.dato = hijos[0]
                    nodo_nuevo.hijoDerecho = n_derecho
                    nodo_nuevo.hijoIzquierdo = n_izquierdo
                    nodos[nodos.length] = nodo_nuevo
                end
                i-=1
            end
            i = 0 
            control = 1 
            if lines.length%2 == 0
                control = 0
            end
            while (i < nodos.length)
                self.raiz = crea1(nodos[i],control)
                if control == 1 
                    control = 0 
                else 
                    control = 1
                end
                i+=1
            end
            self.raiz.dato = "0"
        else 
            puts "Archivo no existe" 
        end   
    end

    def crea1 (a1,i)
        if(self.raiz == nil)
            self.raiz = a1
        elsif(i == 1)
            a1.hijoDerecho.hijoIzquierdo = self.raiz.hijoIzquierdo
            a1.hijoDerecho.hijoDerecho = self.raiz.hijoDerecho
            self.raiz.padre = a1.hijoDerecho
        else
            a1.hijoIzquierdo.hijoIzquierdo = self.raiz.hijoIzquierdo
            a1.hijoIzquierdo.hijoDerecho = self.raiz.hijoDerecho
            self.raiz.padre = a1.hijoIzquierdo
        end
        a1
    end
end

        