texto = "holaamigoscomoestan"

arreglo2 = Array.new()

for i in 0..texto.size() - 1 do
    arreglo2 << texto[i]
end
arreglo = arreglo2.uniq!
frecuencias = Array.new(arreglo.size()){0}

for i in 0..texto.size() - 1 do
    if( arreglo.include?(texto[i]) )
        frecuencias[arreglo.index(texto[i])] = frecuencias[arreglo.index(texto[i])].to_i + 1
    end
end

puts "ARREGLO"
for i in 0..arreglo.size() - 1  do
    print "[ #{arreglo[i]} ]"
end
puts
puts "FRECUENCIAS"
for i in 0..frecuencias.size() - 1  do
    print "[ #{frecuencias[i]} ]"
end
puts
puts "************************************"

for i in 0..arreglo.size()- 1 do
    for j in 0..arreglo.size()-2 do
        if( frecuencias[j] < frecuencias[j+1] )
            temp = frecuencias[j+1]
            temp2 = arreglo[j+1]
            frecuencias[j+1] = frecuencias[j]
            arreglo[j+1] = arreglo[j]
            frecuencias[j] = temp
            arreglo[j] = temp2
        end
    end
end
puts
puts "ARREGLO"
for i in 0..arreglo.size() - 1  do
    print "[ #{arreglo[i]} ]"
end
puts
puts "FRECUENCIAS"
for i in 0..frecuencias.size() - 1  do
    print "[ #{frecuencias[i]} ]"
end





=begin

=begin
        vacio = Nodo.new()
        nodo1 = Nodo.new()
        nodo1 = crea2( arregloNodo[0],arregloNodo[1])
        nodo2 = Nodo.new()
        nodo2 = crea2( arregloNodo[2], arregloNodo[3])
        padre1 = Nodo.new()
        padre1 = crea2( nodo1, nodo2)
        nodo3 = Nodo.new()
        nodo3 = crea2( arregloNodo[4], vacio)
        padre2 = crea2( padre1, nodo3)
       # raizNueva2 = crea2( arregloNodo[0],arregloNodo[1])
        @arregloBinario = Array.new()
        puts
        puts
        recursivo(padre2)
        puts
        puts
=end
#=end