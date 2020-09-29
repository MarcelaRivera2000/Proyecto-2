# Abre y lee un fichero
# Se usa un bloque: el fichero se cierra
# automáticamente al acabar el bloque.
 

   
  # Crea un nuevo fichero, y escribe
  File.open('text.txt', 'w') do |f2|
    # '\n' es el retorno de carro
    f2.puts "Por que la vida \n puede ser maravillosa"
  end

  File.open('fichero.txt', 'r') do |f1|
    while linea = f1.gets
      puts linea
    end
  end