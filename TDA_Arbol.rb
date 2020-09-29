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
        rescue Exception => exc   
            puts "ERROR EN EL PROCESO!"
    end

    def inOrder(nodo_r)
        if(nodo_r == nil)
            return 
        else
<<<<<<< HEAD
            inOrder(nodo_r.hijoIzquierdo)
            print "#{nodo_r.dato} " 
            print "[ #{nodo_r.dato}]"
=======
            inOrder(nodo_r.hijoIzquierdo) 
            print "[ #{nodo_r.dato} ]"
>>>>>>> 080d8dddb1648cdad65b10c9314656fd831db386
            inOrder(nodo_r.hijoDerecho)
        end
        rescue Exception => exc   
            puts "ERROR EN EL PROCESO!"
    end

    def postOrder(raiz)
        if raiz != nil
            postOrder(raiz.hijoIzquierdo)
            postOrder(raiz.hijoDerecho)
            print "[ #{raiz.dato} ]"
        end
        rescue Exception => exc   
            puts "ERROR EN EL PROCESO!"
    end

<<<<<<< HEAD
    def codificador_Huffman(root)
        if (!root)
            return
        end  
        if ( !root.hijoDerecho && !root.hijoIzquierdo )
            print "[#{root.dato.to_i}]"
            return
        end
        if (root.hijoIzquierdo)
            codificador_Huffman(root.hijoIzquierdo);
        end
        if (root.hijoDerecho)
            codificador_Huffman(root.hijoDerecho);
        end
    end

=======
    def codificador_Huffman(texto)
        array=Array.new
        texto.delete!("\n")
        for i in 0..texto.length
            text=""
            f=0
            aux=texto[i]
            for j in 0..texto.length-1
                if(aux == texto[j] )
                    f+=1
                end
            end
            if (f!=0)
                text<<"#{aux},#{f}"
                array<<text    
            end
            
        end
        for l in 0..array.size-1
            cont=0
            aux=array[l]
            for k in 0 .. array.size
                if aux == array[k] 
                    cont+=1
                    if cont>=2
                        array.delete_at(k)
                    end
                end
            end
        end
        array=ordenamiento(array)
        nodo1=Nodo.new()
        nodo2=Nodo.new()
        array2=Array.new()
        while (array[0]!=nil && array[1]!=nil)
            n1=array[0].split(",")
            n2=array[1].split(",")
            nodo1.dato=n1[0]
            nodo1.frecuencia=n1[1]
            nodo2.dato=n2[0]
            nodo2.frecuencia=n2[1]
            array.delete_at(0)
            array.delete_at(1)
            aux=crea2(nodo1,nodo2)
            array2<<aux
        end
        if(array.size!=0)
            n1=array[0].split(",")
            nodo1.dato=n1[0]
            nodo1.frecuencia=n1[1]
            array.delete_at(0)
            array2<<nodo1
        end
        arbol=TDA_Arbol.new
        while (array2.size!=1)
            for bb in 0..array2.size-1
                puts "#{bb} -> #{array2[bb].frecuencia}"
            end
            array2=ordenamientofrecu(array2)
            aux=crea2(array2[0],array2[1])
            array2<<aux
            if(array2.size!=1)
                arbol.raiz=array2[array2.size-1]
            end
            array2.delete_at(0)
            array2.delete_at(1)
        end
        puts arbol.raiz.hijoIzquierdo.frecuencia

    end

    def ordenamientofrecu(array)
        for i in 1..array.size
            for j in 0..array.size-2
                if(array[j].frecuencia.to_i > array[j+1].frecuencia.to_i)
                    aux=array[j]
                    array[j]=array[j+1]
                    array[j+1]=aux
                end
            end
        end
        return array
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

>>>>>>> 080d8dddb1648cdad65b10c9314656fd831db386
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
<<<<<<< HEAD
        end  
        rescue Exception => exc   
            puts "ERROR EN EL PROCESO!" 
=======
        end
>>>>>>> 080d8dddb1648cdad65b10c9314656fd831db386
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
        rescue Exception => exc   
            puts "ERROR EN EL PROCESO!"
    end

    def crea2(a1,a2)
        r=Nodo.new()
        r.hijoIzquierdo=a1
        r.hijoDerecho=a2
        r.frecuencia=a1.frecuencia.to_i+a2.frecuencia.to_i
        return r
    end
end
