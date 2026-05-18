object cosas {
    
}
object knightRider {
    method bultoQueOcupa() {
        return 1
    }
    method peso() {
        return 500
    }
    method peligrosidad() {
        return 10
    }
}
object bumblebee {
    method bultoQueOcupa() {
        return 2
    }
    method cambioAlCargarCamion() {
        return self.transformar()
    }
    var formaActual = true

    method transformar() {
      return {formaActual = false}
    }
    method peso() {
        return 800
    }
    method peligrosidad() {
        if (formaActual){
            return 30
        }
        else {
            return 15
        }
    }
}

object paqueteLadrillos {
    var property ladrillos = 0
    method cambioAlCargarCamion() {
      ladrillos += 12
    }
    method bultoQueOcupa() {
        if (ladrillos.between(101, 300)){
            return 2
        }
        else if (ladrillos < 101){
            return 1
        }
        else{ 
            return 3
        }
    }
    method peso() {
      return 2 * ladrillos
    }
    method peligrosidad() {
      return 2
    }
}
object arenaAGranel {
    method cambioAlCargarCamion() {
      pesoActual += 10
    }
    method bultoQueOcupa() {
        return 1
    }
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
    method cambioAlCargarCamion() {
        estaConMisiles = true
    }
    method bultoQueOcupa(){
        if (self.sinMisiles()){
            return 1
        }
        else {
            return 2
        }
    }
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
    method cambioAlCargarCamion() {
        cosasDentro.forEach({c=>c.cambioAlCargarCamion()})
    }
    method bultoQueOcupa() {
        return 1 + cosasDentro.map({c => c.bultoQueOcupa()})
    }
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
    method cambioAlCargarCamion(){
        pesoActual += 15
    }
    method bultoQueOcupa() {
        return 1
    }
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
    method bultoQueOcupa() {
        return 2
    }
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