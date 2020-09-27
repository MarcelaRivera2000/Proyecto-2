load "Nodo.rb"
class TDA_Arbol
    attr_accessor :raiz
    def initialize()
        self.raiz=Nodo.new("0",nil)
    end 
<<<<<<< HEAD
    def preorder
    end
=======

    def preOrder(raiz)
        if raiz != nil
            print "[ #{raiz.dato} ]"
            postOrder(raiz.hijoIzquierdo)
            postOrder(raiz.hijoDerecho)
        end
    end

>>>>>>> 71a6847f20bd1e3d0306989446b111958109fde0
    def inOrder(nodo_r)
        if(nodo_r == nil)
            return 
        else
            inOrder(nodo_r.hijoIzquierdo)
<<<<<<< HEAD
            print "#{nodo_r.dato} " 
=======
            print "[ #{nodo_r.dato} ]"
>>>>>>> 71a6847f20bd1e3d0306989446b111958109fde0
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
<<<<<<< HEAD
    def codificador_Huffman(archivoTxt)
=======

    def codificador_Huffman()
>>>>>>> 71a6847f20bd1e3d0306989446b111958109fde0
        
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
<<<<<<< HEAD
        return temp
    end
end
=======
        raiz = temp
    end
end

        
>>>>>>> 71a6847f20bd1e3d0306989446b111958109fde0
