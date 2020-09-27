load "Nodo.rb"

class TDA_Arbol
    attr_accessor :raiz
    def initialize()
        self.raiz=Nodo.new("0",nil)
    end 

    def preorder
        if raiz != nil
            postOrder(raiz.hijoDerecho)
            postOrder(raiz.hijoIzquierdo)
            print "[ #{raiz.dato} ]"
        end
    end
    def postOrder(raiz)
        if raiz != nil
            postOrder(raiz.hijoIzquierdo)
            postOrder(raiz.hijoDerecho)
            print "[ #{raiz.dato} ]"
        end
    end

    def codificador_Huffman(texto)
        for i in 0..texto.size 
            puts "hello"
        end
    end 

    def codificador_Huffman()
        
    end
    def descodificador_Huffman
    end

    def Leer( archivoTxt )
        print archivoTxt
        #archivoTxt = "C:/Users/James Josué Molina/Desktop/jjjj.txt"   
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
                    temp.hijoDerecho= Nodo.new(hijos[0],temp) 
                    temp.hijoIzquierdo= Nodo.new(hijos[1],temp)
                else
                    if (temp.dato != "0")
                        temp = temp.padre
                    end
                    if control == 1 
                        temp = temp.hijoDerecho
                        control = 0
                    else
                        temp = temp.hijoIzquierdo
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
        postOrder(temp)
        #return temp
    end
end
