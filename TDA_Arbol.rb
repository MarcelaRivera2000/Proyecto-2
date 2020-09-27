load "Nodo.rb"
class TDA_Arbol
    attr_accessor :raiz
    def initialize()
        self.raiz=Nodo.new("0",nil)
    end 

    def preOrder(raiz)
        if raiz != nil
            print "[ #{raiz.dato} ]"
            postOrder(raiz.hijoIzquierdo)
            postOrder(raiz.hijoDerecho)
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

    def codificador_Huffman(texto,archivoTxt)
        array=Array.new
        for i in 0..texto.length
            text=""
            frecuencia=0
            aux=texto[i]
            for j in 0..texto.length
                if(aux==texto[j])
                    frecuencia+=1
                end
            end
            text<<" #{aux} , #{frecuencia}"
            array<<text
        end
        size=array.size
        for l in 0..array.size
            cont=0
            aux=array[l]
            for k in 0 .. array.size
                if(aux==array[k])
                    cont+=1
                    if cont>=2
                        array.delete_at(k)
                    end
                end
            end
        end
        array2=ordenamiento(array)
        for o in 0..array2.size
            puts array2[o]
        end
        

    end
    
    def ordenamiento(array)
        for i in 1..array.size
            for j in 0..array.size-2
                num=array[j].split(",")
                num2=array[j+1].split(",")
                if(num[1].to_i > num2[1].to_i)
                    aux=array[j]
                    array[j]=array[j+1]
                    array[j+1]=aux
                end
            end
        end
        return array
    end

    def recursivo(nodo,text)
        if(nodo.padre !=nil)
            aux=nodo.padre
            if(aux.hijoIzquierdo == nodo)
                text<<"0"
            else
                text<<"1"
            end
            recursivo(aux,text)
        else
            return text
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
        postOrder(temp)
        return temp
        raiz = temp
    end
end