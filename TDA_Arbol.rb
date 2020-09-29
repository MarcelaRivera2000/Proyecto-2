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
            inOrder(nodo_r.hijoIzquierdo)
            print "[ #{nodo_r.dato} ]" 
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

    def codificador_HuffmanMarcela(root)
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
        rescue Exception => exc   
            puts "ERROR EN EL PROCESO!"
    end

    def codificador_Huffman(texto)
        arreglo2 = Array.new()
        for i in 0..texto.size() - 1 do
            arreglo2 << texto[i]
        end
        caracteres = arreglo2.uniq!
        frecuencias = Array.new(caracteres.size()){0}
        for i in 0..texto.size() - 1 do
            if( caracteres.include?(texto[i]) )
                frecuencias[caracteres.index(texto[i])] = frecuencias[caracteres.index(texto[i])].to_i + 1
            end
        end
        for i in 0..caracteres.size()- 1 do
            for j in 0..caracteres.size()-2 do
                if( frecuencias[j] > frecuencias[j+1] )
                    temp = frecuencias[j+1]
                    temp2 = caracteres[j+1]
                    frecuencias[j+1] = frecuencias[j]
                    caracteres[j+1] = caracteres[j]
                    frecuencias[j] = temp
                    caracteres[j] = temp2
                end
            end
        end
        arregloNodo = Array.new()
        bool=true
        while caracteres[0] != nil
            nodo1 = Nodo.new()
            nodo1.dato = "#{caracteres[0]}"
            for i in 0..caracteres.size()-1 do
                print "<[#{caracteres[i]}]>"
            end
            print "\n"
            nodo1.frecuencia = frecuencias[0]
            nodo2 = Nodo.new()
            nodo2.dato = caracteres[1]
            nodo2.frecuencia = frecuencias[1]
            arregloNodo << crea2( nodo1, nodo2 )
            frecuencias.delete_at(0)
            frecuencias.delete_at(0) 
            caracteres.delete_at(0)
            caracteres.delete_at(0) 
            for i in 0..arregloNodo.size()- 1 do
                for j in 0..arregloNodo.size()-2 do
                    if( arregloNodo[j].frecuencia > arregloNodo[j+1].frecuencia )
                        temp = arregloNodo[j+1]
                        arregloNodo[j+1] = arregloNodo[j]
                        arregloNodo[j] = temp
                    end
                end
            end 
            for i in 0..arregloNodo.size()-1 do
                print " -[#{arregloNodo[i].dato}]- "
            end
        end
        loop do
            if( arregloNodo[0]!=nil && arregloNodo[1]!=nil ) then break end
        end 
        while arregloNodo[1]!=nil 
            arregloNodo<<crea2(arregloNodo[0],arregloNodo[1])
            arregloNodo.delete_at(0)
            arregloNodo.delete_at(0)
            for i in 0..arregloNodo.size()- 1 do
                for j in 0..arregloNodo.size()-2 do
                    if( arregloNodo[j].frecuencia > arregloNodo[j+1].frecuencia )
                        temp = arregloNodo[j+1]
                        arregloNodo[j+1] = arregloNodo[j]
                        arregloNodo[j] = temp
                    end
                end
            end
            print "\n"
            for i in 0..arregloNodo.size()-1 do
                print " >[#{arregloNodo[i].dato}]< "
            end
            if (arregloNodo[1]==nil)
                raizNueva=Nodo.new()
                raizNueva=arregloNodo[arregloNodo.size-1]
                puts "\nraiz: #{raizNueva.frecuencia}"
                recursivo(raizNueva)
                for i in 0..@arregloBinario.size() - 1 do
                    print "[#{@arregloBinario[i]}]"
                end
            end
        end
        rescue Exception => exc   
        puts "ERROR EN EL PROCESO!"
    end

    def recursivo(root)
        if (!root)
            return
        end
        if ( !root.hijoDerecho && !root.hijoIzquierdo )
            print " #[#{root.dato}]# "
            return
        end
        if (root.hijoIzquierdo)
            @arregloBinario.push(0)
            recursivo(root.hijoIzquierdo);
        end
        if (root.hijoDerecho)
            @arregloBinario.push(1)
            recursivo(root.hijoDerecho);
        end
    end

    def escribir(raiz)
        puts "\nIngrese el nombre del archivo: "
        archivo=gets
        while (raiz!=nil )
            File.write(archivo.delete!("\n"),"#{raiz.hijoIzquierdo.frecuencia},#{raiz.hijoIzquierdo.dato} ;#{raiz.hijoDerecho.frecuencia},#{raiz.hijoDerecho.dato}")
        end
        rescue Exception => exc   
            puts "ERROR EN EL PROCESO!"
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
        rescue Exception => exc   
            puts "ERROR EN EL PROCESO!" 
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
        r.dato=a1.frecuencia.to_i+a2.frecuencia.to_i
        a1.padre=r
        a2.padre=r
        return r
    end
end