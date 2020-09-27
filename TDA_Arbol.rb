load "Nodo.rb"
class TDA_Arbol
    attr_accessor :raiz
    def initialize()
        self.raiz=Nodo.new("0",nil)
    end 
    def preorder
    end
    def inOrder(nodo_r)
        if(nodo_r == nil)
            return 
        else
            inOrder(nodo_r.hijoIzquierdo)
            print "#{nodo_r.dato} " 
            inOrder(nodo_r.hijoDerecho)
        end
    end
    def postOrder(raiz)
        if raiz != nil
            postOrder(raiz.hijoIzquierdo)
            postOrder(raiz.hijoDerecho)
            puts "[ #{raiz.dato} ]"
        end
    end
    def codificador_Huffman(archivoTxt)
        
    end
    def descodificador_Huffman
    end
    def Leer( archivoTxt )
        if(File.file?(archivoTxt))
            archivo = File.read( archivoTxt )
            lines = archivo.split("\n")
            numero_hijos = lines[0].to_i
            i = 1;
            temp = self.raiz
            control = 1
            while (i<lines.length)
                if(lines[i] != "")
                    hijos = lines[i].split(",")
                    temp.hijoIzquierdo= Nodo.new(hijos[0],temp) 
                    temp.hijoDerecho= Nodo.new(hijos[1],temp)
                    temp = temp.hijoDerecho
                    control = 1
                else
                    if (temp.dato != "0")
                        temp = temp.padre 
                    end
                    if control == 1 
                        temp = temp.hijoIzquierdo
                        control = 0
                    else
                        temp = temp.hijoDerecho
                        control = 1
                    end
                end
                i+=1
            end
        else 
            puts "Archivo no existe" 
        end
        while temp.padre != nil
            temp = temp.padre
        end
        return temp
    end
end