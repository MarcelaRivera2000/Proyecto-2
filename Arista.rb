class Arista
    def initialize(origen,destino)
        @v_origen=origen
        @v_destino=destino
    end

    def setDestino( destino )
        @destino = destino
    end

    def setPeso( peso )
        @peso = peso
    end

    def getDestino
        return destino
    end

    def getPeso
        return peso
    end

end