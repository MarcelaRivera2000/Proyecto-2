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

    def codificador_Huffman(texto)
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