object cosas {
    
}
object knightRider {
    method peso() {
        return 500
    }
    method peligrosidad() {
        return 10
    }
}
object bumblebee {
    var formaActual = bumblebeeRobot

    method transformar(nuevaForma) {
      return {formaActual = nuevaForma}
    }
    method peso() {
        return 800
    }
    method peligrosidad() {
        return formaActual.peligrosidad()
    }
}
object bumblebeeRobot {
    method peligrosidad() {
      return 30
    }
}
object bumblebleeAuto {
    method peligrosidad() {
      return 15
    }
}
object paqueteLadrillos {
    var property ladrillos = 0
    method peso() {
      return 2 * ladrillos
    }
    method peligrosidad() {
      return 2
    }
}
object arenaAGranel {
    var property pesoActual = 0
    method peso() {
        return pesoActual
    }
    method peligrosidad() {
      return 1
    }
}
object bateriaAntiaerea {
    var estaConMisiles = true
    method sinMisiles() {
        return not estaConMisiles
    }
    method peso() {
      if (self.sinMisiles()){
        return 200 
      }
      else{
        return 300
      }

    }
    method peligrosidad() {
      if (self.sinMisiles()){
        return 0
      }
      else{
        return 100
      }
        
    }
}
object contenedorPortuario {
    const cosasDentro = []
    method meterCosasDentro(unaCosa) {
      cosasDentro.add(unaCosa)
    }
    method peso() {
      return 100 + cosasDentro.sum({c => c.peso()})
    }
    method peligrosidad() {
      if (cosasDentro.isEmpty()){
        return 0
      }
      else {
      return cosasDentro.max({c => c.peligrosidad()})
        }
    }
}
object residuosRadioactivos {
    var pesoActual = 0
    method cambiarPeso(nuevoPeso) {
      pesoActual = nuevoPeso
    }
    method peso() {
      return pesoActual
    }
    method peligrosidad() {
      return 200
    }
}
object embalajeSeguridad {
    var cosasQueCubre = knightRider
    method cambiarCosaQueCubre(unaCosa) {
        cosasQueCubre = unaCosa
    }
    method peso() {
      return cosasQueCubre.peso()
    }
    method peligrosidad() {
      return cosasQueCubre.peligrosidad() * 0.5
    }
}