load "Nodo.rb"
class TDA_Arbol
    attr_accessor :raiz
    def initialize()
        self.raiz=Nodo.new("0",nil)
    end 
    def preorder
    end
    def postOrder()
        if raiz != nil
            postorden(raiz.hijoIzquierdo)
            postorden(raiz.hijoDerecho)
            puts "[ #{raiz.dato} ]"
        end
    end
<<<<<<< HEAD
end
=======
    def codificador_Huffman(texto)
        for i in 0..texto.size 
            puts "hello"
        end
    end
    def descodificador_Huffman
    end
    def Leer( archivoTxt )
        if(File.file?(archivoTxt))
            archivo = File.read( archivoTxt )
            lines = archivo.split("\n")
            numero_hijos = lines[0].to_i
            i = 1;
            temp = raiz
            control = 1
            while (i<lines.length)
                if(lines[i] != "")
                    hijos = lines[i].split(",")
                    temp.hijoDerecho= Nodo.new(hijos[0],temp) 
                    temp.hijoIzquierdo= Nodo.new(hijos[1],temp)
                    temp= temp.hijoDerecho
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
    end
end

>>>>>>> 1032d3441cd562ad49ff7b2d6c5234fe344f33d9
