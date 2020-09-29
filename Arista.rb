class Arista
    attr_accessor :v_origen, :v_destino, :v_peso
    def initialize()
        @v_origen = 0
        @v_destino = 0
        @v_peso = 0
    end 

    def initialize(origen,destino,peso)
        @v_origen = origen
        @v_destino = destino
        @v_peso = peso
    end

    def toString
        return "[Origen:  #{@v_origen} ][ Destino: #{@v_destino} ][ Peso: #{@v_peso} ] "
    end

    def equals( arista )
        if( arista.v_origen == @v_origen && arista.v_destino == @v_destino && arista.v_peso== @v_peso )
            return true
        else
            return false
        end
    end 
end